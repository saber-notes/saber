package com.example.onyxsdk_pen

import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.Rect
import android.view.SurfaceView
import android.view.View
import com.onyx.android.sdk.data.note.TouchPoint
import com.onyx.android.sdk.pen.RawInputCallback
import com.onyx.android.sdk.pen.TouchHelper
import com.onyx.android.sdk.pen.data.TouchPointList
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import java.util.Timer
import java.util.TimerTask
import androidx.annotation.NonNull

internal class OnyxsdkPenArea(context: Context, messenger: BinaryMessenger, id: Int, creationParams: Map<String?, Any?>?) : PlatformView, MethodCallHandler {

    enum class StrokeStyle(val Id: Int) {
        FountainPen(0),
        Pen(1),
        Brush(2),
        Pencil(3),
        Marker(4)
    }

    private val channel: MethodChannel = MethodChannel(messenger, "onyxsdk_pen_area")

    companion object {
        private val pointsToRedraw = 20
    }

    private var strokeWidth = 0.0f
    private var strokeColor = Color.BLACK
    private var strokeStyle = StrokeStyle.FountainPen

    private fun updateStroke(paramsRef: Map<String, Any>?) {
        /*
         Flutter ints are variable width
         Personally, I think it is utterly dumb. I hope there is a way to fix
         int size in flutter (why would you need 64 bits to store srgb??),
         but unless or until there isn't, this stupidity should be performed
         */
        val pureColor = (paramsRef?.get("strokeColor") as? Long)?.toInt()
                              ?: paramsRef?.get("strokeColor") as? Int
                              ?: Color.BLACK
        /*
         ONYXSDK Pen saturates the colors. Whatever it deems as "light" (luma < 128?)
         gets automagically turned to white. Transparency is also accounted apparently.
         Unless this is some case-by-case situation, if resulting color, assuming
         being drawn on absolutely white background, with a fully opaque brush
         is lighter than a certain unknown arbitrary threshold, it turns white,
         otherwise, is saturated to max.
         These thoughts are, however, purely observational. Nothing in documentation
         says this and no binary artifacts have been decompiled to come to these
         conclusions. Thus, feel free to correct my incompetence if I turn out wrong
         */
        var dest = FloatArray(3)
        Color.RGBToHSV(
            Color.red(pureColor),
            Color.green(pureColor),
            Color.blue(pureColor),
            dest
        )
        /*
         Saturation
         I suppose clamping is a sound idea, but the extremes to which the lib
         takes them are unacceptable. Make it white if visually indistinguishable
         from white and colorful otherwise.
        */
        if (dest[1] < 0.05) {
            dest[1] = 0.0f
        } else {
            dest[1] = 1.0f
        }
        /*
         Value
         I want color to show
         So clamp to black if it's visually indistinguishable from black
         and to colorful otherwise. E.g. brown will look red instead of black
        */
        if (dest[2] < 0.2) {
            dest[2] = 0.0f
        } else {
            dest[2] = 1.0f
        }
        strokeColor = Color.HSVToColor(dest)
        strokeWidth = (paramsRef?.get("strokeWidth") as? Double ?: 3.0).toFloat()
        strokeStyle = when (paramsRef?.get("strokeStyle") as? Int ?: 0) {
            0 -> StrokeStyle.FountainPen
            1 -> StrokeStyle.Pen
            2 -> StrokeStyle.Brush
            3 -> StrokeStyle.Pencil
            4 -> StrokeStyle.Marker
            else -> StrokeStyle.Pen
        }
        touchHelper.setStrokeStyle(strokeStyleToOnyx(strokeStyle))
        touchHelper.setStrokeWidth(strokeWidth)
        touchHelper.setStrokeColor(strokeColor)
    }


    private val touchHelper: TouchHelper by lazy { TouchHelper.create(view, callback) }

    private val view: SurfaceView = SurfaceView(context)
    override fun getView(): View {
        return view
    }

    private val paint: Paint = Paint()
    private var pointsSinceLastRedraw = 0

    private val currentStroke: ArrayList<TouchPoint> = ArrayList()

    private var refreshTimerTask: TimerTask? = null
    private val refreshDelayMs: Long by lazy { creationParams?.get("refreshDelayMs") as? Long ?: 1000 }

    private val callback: RawInputCallback = object: RawInputCallback() {
        fun reset() {
            currentStroke.clear()
            pointsSinceLastRedraw = 0
            drawPreview()
            refreshTimerTask?.cancel()
        }
        fun update(touchPoint: TouchPoint) {
            pointsSinceLastRedraw++
            if (pointsSinceLastRedraw < pointsToRedraw) return
            pointsSinceLastRedraw = 0

            currentStroke.add(touchPoint)

            drawPreview()
        }

        fun scheduleRefresh() {
            refreshTimerTask?.cancel()
            refreshTimerTask = object : TimerTask() {
                override fun run() {
                    touchHelper.setRawDrawingEnabled(false)
                    touchHelper.setRawDrawingEnabled(true)
                }
            }
            Timer().schedule(refreshTimerTask, refreshDelayMs)
        }


        override fun onBeginRawDrawing(b: Boolean, touchPoint: TouchPoint) {
            // begin of stylus data
            reset()
        }

        override fun onEndRawDrawing(b: Boolean, touchPoint: TouchPoint) {
            // end of stylus data
            reset()
            scheduleRefresh()
        }

        override fun onRawDrawingTouchPointMoveReceived(touchPoint: TouchPoint) {
            // stylus data during stylus moving
            update(touchPoint)
        }

        override fun onRawDrawingTouchPointListReceived(touchPointList: TouchPointList) {
        }

        override fun onBeginRawErasing(b: Boolean, touchPoint: TouchPoint) {
            reset()
        }

        override fun onEndRawErasing(b: Boolean, touchPoint: TouchPoint) {
            reset()
            scheduleRefresh()
        }

        override fun onRawErasingTouchPointMoveReceived(touchPoint: TouchPoint) {
            update(touchPoint)
        }

        override fun onRawErasingTouchPointListReceived(touchPointList: TouchPointList) {
        }
    }

    private fun strokeStyleToOnyx(style: StrokeStyle): Int {
        return when (style) {
            StrokeStyle.FountainPen -> TouchHelper.STROKE_STYLE_FOUNTAIN
            StrokeStyle.Pen -> TouchHelper.STROKE_STYLE_PENCIL
            StrokeStyle.Brush -> TouchHelper.STROKE_STYLE_NEO_BRUSH
            StrokeStyle.Pencil -> TouchHelper.STROKE_STYLE_CHARCOAL
            StrokeStyle.Marker -> TouchHelper.STROKE_STYLE_MARKER
        }
    }

    fun drawPreview() {
        currentStroke.clear()
    }

    init {
        channel.setMethodCallHandler(this)
        view.addOnLayoutChangeListener { _, _, _, _, _, _, _, _, _ ->
            val limit = Rect()
            val exclude = emptyList<Rect>()
            view.getLocalVisibleRect(limit)
            touchHelper.setLimitRect(limit, exclude)

            touchHelper.setRawDrawingEnabled(false)
            touchHelper.setRawDrawingEnabled(true)
        }

        paint.setStrokeWidth(strokeWidth)
        paint.setColor(strokeColor)

        touchHelper.openRawDrawing()
        touchHelper.setRawDrawingEnabled(true)
        touchHelper.setRawDrawingRenderEnabled(false)

        drawPreview()
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "updateStroke") {
            val params = call.arguments<Map<String, Any>?>()
            updateStroke(params)
            result.success(null)
        } else {
            result.notImplemented()
        }
    }
    
    override fun dispose() {
        touchHelper.closeRawDrawing()
    }
}

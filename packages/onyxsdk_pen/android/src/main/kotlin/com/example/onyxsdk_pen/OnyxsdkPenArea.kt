package com.example.onyxsdk_pen

import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.Rect
import android.util.Log
import android.view.SurfaceView
import android.view.View
import com.onyx.android.sdk.data.note.TouchPoint
import com.onyx.android.sdk.pen.RawInputCallback
import com.onyx.android.sdk.pen.TouchHelper
import com.onyx.android.sdk.pen.data.TouchPointList
import io.flutter.plugin.platform.PlatformView

internal class OnyxsdkPenArea(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    companion object {
        private val pointsToRedraw = 20
        private val strokeWidth = 3f
    }

    private val touchHelper: TouchHelper by lazy { TouchHelper.create(view, callback) }

    private val view: SurfaceView = SurfaceView(context)
    override fun getView(): View {
        return view
    }

    private val paint: Paint = Paint()
    private var startPoint: TouchPoint? = null
    private var pointsSinceLastRedraw = 0

    private val callback: RawInputCallback = object: RawInputCallback() {
        override fun onBeginRawDrawing(b: Boolean, touchPoint: TouchPoint) {
            // begin of stylus data
            startPoint = touchPoint
            pointsSinceLastRedraw = 0
        }

        override fun onEndRawDrawing(b: Boolean, touchPoint: TouchPoint) {
            // end of stylus data
            startPoint = null
            drawPreview(null)
        }

        override fun onRawDrawingTouchPointMoveReceived(end: TouchPoint) {
            // stylus data during stylus moving

            pointsSinceLastRedraw++
            if (pointsSinceLastRedraw < pointsToRedraw) return
            pointsSinceLastRedraw = 0

            drawPreview(end)
        }

        override fun onRawDrawingTouchPointListReceived(touchPointList: TouchPointList) {
        }

        override fun onBeginRawErasing(b: Boolean, touchPoint: TouchPoint) {
        }

        override fun onEndRawErasing(b: Boolean, touchPoint: TouchPoint) {
        }

        override fun onRawErasingTouchPointMoveReceived(touchPoint: TouchPoint) {
        }

        override fun onRawErasingTouchPointListReceived(touchPointList: TouchPointList) {
        }
    }

    fun drawPreview(end: TouchPoint?) {
        val canvas: Canvas = view.getHolder().lockCanvas() ?: return
        canvas.drawColor(Color.WHITE) // this is drawn as transparent by onyx sdk

        val start: TouchPoint? = startPoint

        if (start == null || end == null) {
            view.getHolder().unlockCanvasAndPost(canvas)
            return
        }

        canvas.drawLine(start.getX(), start.getY(), end.getX(), end.getY(), paint)
        view.getHolder().unlockCanvasAndPost(canvas)
    }

    init {
        view.addOnLayoutChangeListener { _, _, _, _, _, _, _, _, _ ->
            val limit = Rect()
            val exclude = emptyList<Rect>()
            view.getLocalVisibleRect(limit)
            touchHelper.setLimitRect(limit, exclude)
        }

        paint.setStrokeWidth(strokeWidth)
        paint.setColor(Color.BLACK)

        touchHelper.setStrokeWidth(strokeWidth)
        touchHelper.openRawDrawing()
        touchHelper.setRawDrawingEnabled(true)
        touchHelper.setRawDrawingRenderEnabled(false)
    }

    override fun dispose() {
        touchHelper.closeRawDrawing()
    }
}

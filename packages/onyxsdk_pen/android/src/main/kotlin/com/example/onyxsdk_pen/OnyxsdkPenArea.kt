package com.example.onyxsdk_pen

import android.content.Context
import android.graphics.Color
import android.util.Log
import android.view.View
import com.onyx.android.sdk.data.note.TouchPoint
import com.onyx.android.sdk.pen.RawInputCallback
import com.onyx.android.sdk.pen.TouchHelper
import com.onyx.android.sdk.pen.data.TouchPointList
import io.flutter.plugin.platform.PlatformView

internal class OnyxsdkPenArea(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val touchHelper: TouchHelper

    private val view: View
    override fun getView(): View {
        return view
    }

    private val callback: RawInputCallback = object: RawInputCallback() {
        override fun onBeginRawDrawing(b: Boolean, touchPoint: TouchPoint) {
            // begin of stylus data
            Log.d("OnyxsdkPenArea", "onBeginRawDrawing")
        }

        override fun onEndRawDrawing(b: Boolean, touchPoint: TouchPoint) {
            // end of stylus data
        }

        override fun onRawDrawingTouchPointMoveReceived(touchPoint: TouchPoint) {
            // stylus data during stylus moving
            Log.d("OnyxsdkPenArea", "onRawDrawingTouchPointMoveReceived: " + touchPoint.toString())
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

    init {
        view = View(context)
        touchHelper = TouchHelper.create(view, callback)
        touchHelper.setStrokeWidth(3.0f)
        touchHelper.openRawDrawing()
        touchHelper.setRawDrawingEnabled(true)
    }

    override fun dispose() {
        touchHelper.closeRawDrawing()
    }
}

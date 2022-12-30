package com.example.onyxsdk_pen

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView

internal class OnyxsdkPenArea(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val textView: TextView

    override fun getView(): View {
        return textView
    }

    override fun dispose() {}

    init {
        textView = TextView(context)
        textView.textSize = 36f
        textView.setBackgroundColor(Color.argb(150, 255, 255, 255))
        textView.text = "Rendered on a native Android view (id: $id)"
    }
}

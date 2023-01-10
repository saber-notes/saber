package com.example.onyxsdk_pen

import android.content.Context
import android.view.View
import io.flutter.plugin.platform.PlatformView

internal class OnyxsdkPenArea(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val view: View = View(context)
    override fun getView(): View {
        return view
    }

    init {
    }

    override fun dispose() {
    }
}

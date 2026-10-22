package com.adilhanney.saber

import android.os.Bundle
import android.content.ActivityNotFoundException
import android.content.Intent
import android.os.Build
import android.view.KeyEvent
import androidx.core.view.ViewCompat
import androidx.core.view.WindowCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Intent.FLAG_ACTIVITY_NEW_TASK

class MainActivity: FlutterActivity() {
    private var spenChannel: MethodChannel? = null
    private val supportsSpenRemote by lazy {
        Build.MANUFACTURER.equals("samsung", ignoreCase = true) &&
            packageManager.hasSystemFeature("com.sec.feature.spen_usp")
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        spenChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "saber/spen").also { channel ->
            channel.setMethodCallHandler { call, result ->
                when (call.method) {
                    "isSupported" -> result.success(supportsSpenRemote)
                    "openSettings" -> {
                        val actions = listOf(
                            "com.samsung.android.service.aircommand.action.BLE_SPEN_SETTINGS",
                            "com.samsung.android.service.aircommand.action.SPEN_SETTINGS",
                            "com.samsung.settings.USEFUL_FEATURE_MAIN_SETTINGS",
                        )
                        var opened = false
                        for (action in actions) {
                            try {
                                startActivity(Intent(action))
                                opened = true
                                break
                            } catch (_: ActivityNotFoundException) {
                            } catch (_: SecurityException) {
                            }
                        }
                        if (opened) result.success(null)
                        else result.error("unavailable", "Samsung S Pen settings are unavailable", null)
                    }
                    else -> result.notImplemented()
                }
            }
        }
    }

    override fun dispatchKeyEvent(event: KeyEvent): Boolean {
        if (supportsSpenRemote && event.keyCode == KeyEvent.KEYCODE_F12) {
            if (event.action == KeyEvent.ACTION_DOWN && event.repeatCount == 0) {
                spenChannel?.invokeMethod("undo", null)
            }
            return true
        }
        return super.dispatchKeyEvent(event)
    }

    override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
        spenChannel?.setMethodCallHandler(null)
        spenChannel = null
        super.cleanUpFlutterEngine(flutterEngine)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        if (intent.getIntExtra("org.chromium.chrome.extra.TASK_ID", -1) == this.taskId) {
            this.finish()
            intent.addFlags(FLAG_ACTIVITY_NEW_TASK);
            startActivity(intent);
        }
        super.onCreate(savedInstanceState)

        WindowCompat.setDecorFitsSystemWindows(window, false)

        val windowInsetsController = WindowCompat.getInsetsController(window, window.decorView)
        windowInsetsController.isAppearanceLightNavigationBars = true
    }
}

package com.adilhanney.saber

import android.os.Bundle
import androidx.core.view.ViewCompat
import androidx.core.view.WindowCompat
import io.flutter.embedding.android.FlutterActivity
import android.content.Intent
import android.content.Intent.FLAG_ACTIVITY_NEW_TASK
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.view.WindowManager
import android.app.KeyguardManager
import android.content.Context
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private var channel: MethodChannel? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        if (intent.getIntExtra("org.chromium.chrome.extra.TASK_ID", -1) == this.taskId) {
            this.finish()
            intent.addFlags(FLAG_ACTIVITY_NEW_TASK)
            startActivity(intent)
        }
        super.onCreate(savedInstanceState)

        WindowCompat.setDecorFitsSystemWindows(window, false)

        val windowInsetsController = WindowCompat.getInsetsController(window, window.decorView)
        windowInsetsController.isAppearanceLightNavigationBars = true

        updateLockScreenFlags(intent)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        updateLockScreenFlags(intent)
        sendIntentToFlutter(intent)
    }

    private fun sendIntentToFlutter(intent: Intent?, retries: Int = 5) {
        val ch = channel
        if (intent?.action == "android.intent.action.CREATE_NOTE") {
            if (ch == null) {
                if (retries > 0) {
                    Handler(Looper.getMainLooper()).postDelayed({
                        sendIntentToFlutter(intent, retries - 1)
                    }, 200)
                }
                return
            }
            ch.invokeMethod("onLockScreenNoteIntent", null, object : MethodChannel.Result {
                override fun success(result: Any?) {}
                override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {}
                override fun notImplemented() {
                    if (retries > 0) {
                        Handler(Looper.getMainLooper()).postDelayed({
                            sendIntentToFlutter(intent, retries - 1)
                        }, 200)
                    }
                }
            })
        } else {
            ch?.invokeMethod("onResetLockScreenNoteMode", null)
        }
    }

    override fun onResume() {
        super.onResume()
        val keyguardManager = getSystemService(Context.KEYGUARD_SERVICE) as? KeyguardManager
        val isLocked = keyguardManager?.isKeyguardLocked ?: false
        if (!isLocked) {
            setLockScreenFlags(false)
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.adilhanney.saber/lock_screen")
        channel?.setMethodCallHandler { call, result ->
            when (call.method) {
                "isLockScreenNote" -> {
                    val keyguardManager = getSystemService(Context.KEYGUARD_SERVICE) as? KeyguardManager
                    val isLocked = keyguardManager?.isKeyguardLocked ?: false
                    result.success(intent?.action == "android.intent.action.CREATE_NOTE" && isLocked)
                }
                "isCreateNoteIntent" -> {
                    result.success(intent?.action == "android.intent.action.CREATE_NOTE")
                }
                "isKeyguardLocked" -> {
                    val keyguardManager = getSystemService(Context.KEYGUARD_SERVICE) as? KeyguardManager
                    val isLocked = keyguardManager?.isKeyguardLocked ?: false
                    result.success(isLocked)
                }
                "clearLockScreenFlags" -> {
                    setLockScreenFlags(false)
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun updateLockScreenFlags(intent: Intent?) {
        val keyguardManager = getSystemService(Context.KEYGUARD_SERVICE) as? KeyguardManager
        val isLocked = keyguardManager?.isKeyguardLocked ?: false
        val showWhenLocked = intent?.action == "android.intent.action.CREATE_NOTE" && isLocked
        setLockScreenFlags(showWhenLocked)
    }

    private fun setLockScreenFlags(showWhenLocked: Boolean) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O_MR1) {
            setShowWhenLocked(showWhenLocked)
            setTurnScreenOn(showWhenLocked)
        } else {
            @Suppress("DEPRECATION")
            if (showWhenLocked) {
                window.addFlags(
                    WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED or
                    WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON
                )
            } else {
                window.clearFlags(
                    WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED or
                    WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON
                )
            }
        }
    }
}

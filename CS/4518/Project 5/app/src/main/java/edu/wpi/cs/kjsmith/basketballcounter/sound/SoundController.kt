package edu.wpi.cs.kjsmith.basketballcounter.sound

import android.content.res.AssetFileDescriptor
import android.content.res.AssetManager
import android.media.SoundPool
import android.util.Log
import java.io.IOException
import java.lang.IllegalStateException

class SoundController private constructor(val assets: AssetManager) {

    companion object {
        private var INSTANCE: SoundController? = null

        fun initialize(assets: AssetManager) {
            if (INSTANCE == null) {
                INSTANCE = SoundController(assets)
            }
        }

        fun getInstance(): SoundController {
            return INSTANCE ?: throw IllegalStateException("SoundController must be initialized")
        }
    }

    private val TAG = "SoundController"
    private val SOUND_FOLDER = "cheering_sound"
    private val MAX_SOUNDS = 5

    val sounds: List<Sound>
    private val soundPool = SoundPool.Builder().setMaxStreams(MAX_SOUNDS).build()

    init {
        sounds = loadSounds()
    }

    private fun load(sound: Sound) {
        val fd: AssetFileDescriptor = assets.openFd(sound.assetPath)
        val soundId = soundPool.load(fd, 1)
        sound.soundId = soundId
    }

    fun loadSounds(): List<Sound> {
        val soundNames: Array<String>
        try {
            soundNames = assets.list(SOUND_FOLDER)!!
        } catch (e: Exception) {
            Log.e(TAG, "Could not list assets", e)
            return emptyList()
        }
        val sounds = mutableListOf<Sound>()
        soundNames.forEach { filename ->
            val assetPath = "$SOUND_FOLDER/$filename"
            val sound = Sound(assetPath)
            try {
                load(sound)
                sounds.add(sound)
            } catch (e: IOException) {
                Log.e(TAG, "Could not load sound $filename", e)
            }
        }
        return sounds
    }

    fun play(sound: Sound) {
        sound.soundId?.let {
            soundPool.play(it, 1.0f, 1.0f, 1, 0, 1.0f)
        }
    }

}
package edu.wpi.cs.kjsmith.basketballcounter

import android.app.Application
import edu.wpi.cs.kjsmith.basketballcounter.sound.SoundController

class GameApplication: Application() {

    override fun onCreate() {
        super.onCreate()
        GameRepository.initialize(this)
        SoundController.initialize(assets)
    }
}
package edu.wpi.cs.kjsmith.basketballcounter

import android.app.Application
import edu.wpi.cs.kjsmith.basketballcounter.model.Table_Game

class GameApplication: Application() {

    override fun onCreate() {
        super.onCreate()
        GameRepository.initialize(this)
        for (i in 1 .. 150) {
            val game: Table_Game = Table_Game.generateRandomGame()
            MainFragment.gameRepository.addGame(game)
        }
    }
}
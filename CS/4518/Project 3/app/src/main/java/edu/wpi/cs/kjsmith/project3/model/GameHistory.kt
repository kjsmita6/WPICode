package edu.wpi.cs.kjsmith.project3.model

import androidx.lifecycle.ViewModel
import java.util.*
import kotlin.random.Random

class GameHistory: ViewModel() {

    val games: Array<Game?> = arrayOfNulls(100)
    val charPool: List<Char> = ('a'..'z') + ('A'..'Z') + ('0'..'9')


    init {
        for(i: Int in 1 .. 100) {
            val game: Game = Game.generateRandomGame()
            game.index = i
            games[i - 1] = game
        }
    }
}
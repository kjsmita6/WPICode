package edu.wpi.cs.kjsmith.project3.model

import androidx.lifecycle.ViewModel
import java.util.*
import kotlin.random.Random

class Game constructor(var index: Int, val team1: String, val team2: String, val score1: Int, val score2: Int, val time: Date): ViewModel() {

    companion object {

        val charPool: List<Char> = ('a'..'z') + ('A'..'Z') + ('0'..'9')

        fun generateRandomGame(): Game {
            return Game(-1,
                generateRandomString(6), generateRandomString(6),
                Random.nextInt(0, 100), Random.nextInt(0, 100),
                Date())
        }

        private fun generateRandomString(length: Int): String {
            return (1..length).map {
                    i -> Random.nextInt(0, charPool.size)
            }.map(charPool::get).joinToString("")
        }
    }

    fun formatScores(): String {
        return "$score1:$score2"
    }

    fun formatTeams(): String {
        return "Team $team1:Team $team2"
    }
}
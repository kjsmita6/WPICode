package edu.wpi.cs.kjsmith.basketballcounter.model

import androidx.room.Entity
import androidx.room.PrimaryKey
import java.util.*
import kotlin.random.Random

@Entity
data class Table_Game constructor(val teamAName: String, val teamBName: String, val teamAScore: Int, val teamBScore: Int, val date: Date, @PrimaryKey var id: UUID = UUID.randomUUID()) {

    companion object {

        val charPool: List<Char> = ('a'..'z') + ('A'..'Z') + ('0'..'9')

        fun generateRandomGame(): Table_Game {
             return Table_Game(
                generateRandomString(6), generateRandomString(6),
                Random.nextInt(0, 100), Random.nextInt(0, 100),
                Date()
            )
        }

        private fun generateRandomString(length: Int): String {
            return (1..length).map {
                    i -> Random.nextInt(0, charPool.size)
            }.map(charPool::get).joinToString("")
        }
    }
}
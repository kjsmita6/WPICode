package edu.wpi.cs.kjsmith.basketballcounter.model

import java.util.*

data class Game constructor(val uuid: UUID = UUID.randomUUID(), var teamAName: String, var teamBName: String, var teamAScore: Int, var teamBScore: Int, val date: Date) {

    val photoFileName: String get() = "IMG_$uuid.jpg"
}
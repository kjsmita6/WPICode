package edu.wpi.cs.kjsmith.basketballcounter

import android.content.Context
import edu.wpi.cs.kjsmith.basketballcounter.model.Game
import java.io.File

class GameRepository private constructor(val context: Context) {

    private val filesDir = context.applicationContext.filesDir

    companion object {
        private var INSTANCE: GameRepository? = null

        fun initialize(context: Context) {
            if (INSTANCE == null) {
                INSTANCE = GameRepository(context)
            }
        }

        fun get(): GameRepository {
            return INSTANCE ?: throw IllegalStateException("GameRepository must be initialized")
        }
    }

    fun getPhotoFile(game: Game): File = File(filesDir, game.photoFileName)
}
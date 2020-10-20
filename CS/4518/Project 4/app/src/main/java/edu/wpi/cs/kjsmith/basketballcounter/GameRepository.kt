package edu.wpi.cs.kjsmith.basketballcounter

import android.content.Context
import androidx.lifecycle.LiveData
import androidx.room.Room
import edu.wpi.cs.kjsmith.basketballcounter.database.GameDAO
import edu.wpi.cs.kjsmith.basketballcounter.database.GameDatabase
import edu.wpi.cs.kjsmith.basketballcounter.database.migration_1_2
import edu.wpi.cs.kjsmith.basketballcounter.model.Table_Game
import java.lang.IllegalStateException
import java.util.concurrent.Executors

private const val DB_NAME: String = "game-database"

class GameRepository private constructor(context: Context) {

    private val executor = Executors.newSingleThreadExecutor()

    private val database: GameDatabase = Room.databaseBuilder(
        context.applicationContext,
        GameDatabase::class.java,
        DB_NAME
    ).addMigrations(migration_1_2).build()

    private val gameDAO: GameDAO = database.gameDAO()

    fun getGames() = gameDAO.getGames()
    fun getAGames() = gameDAO.getAGames()
    fun getBGames() = gameDAO.getBGames()
    fun getMatchingGames(uuid: String) = gameDAO.getMatchingGames(uuid)

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

    fun updateGame(game: Table_Game) {
        executor.execute {
            gameDAO.updateGame(game)
        }
    }

    fun addGame(game: Table_Game) {
        executor.execute {
            gameDAO.addGame(game)
        }
    }
}
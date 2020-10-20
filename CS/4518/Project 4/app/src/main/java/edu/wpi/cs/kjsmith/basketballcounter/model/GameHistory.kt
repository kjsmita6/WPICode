package edu.wpi.cs.kjsmith.basketballcounter.model

import androidx.lifecycle.LiveData
import edu.wpi.cs.kjsmith.basketballcounter.GameRepository
import edu.wpi.cs.kjsmith.basketballcounter.MainFragment

class GameHistory {

    private val gameRepository: GameRepository = MainFragment.gameRepository

    fun getGames() = gameRepository.getGames()
    fun getAGames() = gameRepository.getAGames()
    fun getBGames() = gameRepository.getBGames()
}
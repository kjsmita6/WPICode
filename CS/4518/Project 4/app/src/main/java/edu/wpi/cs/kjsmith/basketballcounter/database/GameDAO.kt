package edu.wpi.cs.kjsmith.basketballcounter.database

import androidx.lifecycle.LiveData
import androidx.room.Dao
import androidx.room.Insert
import androidx.room.Query
import androidx.room.Update
import edu.wpi.cs.kjsmith.basketballcounter.model.Table_Game

@Dao
interface GameDAO {

    @Query("select * from table_game")
    fun getGames(): LiveData<List<Table_Game>>

    @Query("select count(*) from table_game where id = (:uuid)")
    fun getMatchingGames(uuid: String): LiveData<Int>

    @Query("select * from table_game where teamAScore >= teamBScore")
    fun getAGames(): LiveData<List<Table_Game>>

    @Query("select * from table_game where teamAScore < teamBScore")
    fun getBGames(): LiveData<List<Table_Game>>

    @Update
    fun updateGame(game: Table_Game)

    @Insert
    fun addGame(game: Table_Game)
}
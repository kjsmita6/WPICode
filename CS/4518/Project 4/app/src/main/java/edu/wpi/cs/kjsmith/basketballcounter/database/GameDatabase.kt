package edu.wpi.cs.kjsmith.basketballcounter.database

import androidx.room.Database
import androidx.room.RoomDatabase
import androidx.room.TypeConverters
import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase
import edu.wpi.cs.kjsmith.basketballcounter.model.Table_Game

@Database(entities = [ Table_Game::class ], version=2)
@TypeConverters(GameTypeConverters::class)
abstract class GameDatabase: RoomDatabase() {

    abstract fun gameDAO(): GameDAO

}

val migration_1_2 = object: Migration(1, 2) {
    override fun migrate(database: SupportSQLiteDatabase) {
        // Nothing
    }
}
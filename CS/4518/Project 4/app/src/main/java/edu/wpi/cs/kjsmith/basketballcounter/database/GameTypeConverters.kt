package edu.wpi.cs.kjsmith.basketballcounter.database

import androidx.room.TypeConverter
import java.util.*

class GameTypeConverters {

    @TypeConverter
    fun fromDate(date: Date?): Long? {
        return date?.time
    }

    @TypeConverter
    fun toDate(ms: Long?): Date? {
        return ms?.let {
            Date(it)
        }
    }

    @TypeConverter
    fun toUUID(uuid: String?): UUID? {
        return UUID.fromString(uuid)
    }
    @TypeConverter
    fun fromUUID(uuid: UUID?): String? {
        return uuid?.toString()
    }
}
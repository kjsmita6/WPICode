package edu.wpi.cs.kjsmith.basketballcounter.model

import android.util.Log
import androidx.lifecycle.ViewModel

class ScoreViewModel : ViewModel() {

    val TAG: String = "ScoreViewModel"

    var scoreA: Int = 0
    var scoreB: Int = 0
    var teamA: String = "Team A"
    var teamB: String = "Team B"
    var lastPoint: Int = 0

    override fun onCleared() {
        super.onCleared()
        Log.d(TAG, "Viewmodel about to be cleared")
    }
}
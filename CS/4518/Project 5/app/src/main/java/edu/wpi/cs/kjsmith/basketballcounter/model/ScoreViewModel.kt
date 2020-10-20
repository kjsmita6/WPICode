package edu.wpi.cs.kjsmith.basketballcounter.model

import android.util.Log
import androidx.lifecycle.ViewModel

class ScoreViewModel: ViewModel() {

    lateinit var game: Game

    val TAG: String = "ScoreViewModel"
    var lastPoint: Int = 0

    override fun onCleared() {
        super.onCleared()
        Log.d(TAG, "Viewmodel about to be cleared")
    }
}
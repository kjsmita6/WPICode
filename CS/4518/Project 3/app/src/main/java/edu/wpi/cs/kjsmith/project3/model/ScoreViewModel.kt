package edu.wpi.cs.kjsmith.project3.model

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.ViewModel

class ScoreViewModel : ViewModel() {

    val TAG: String = "ScoreViewModel"

    var scoreA: Int = 0
    var scoreB: Int = 0
    var lastPoint: Int = 0

    override fun onCleared() {
        super.onCleared()
        Log.d(TAG, "Viewmodel about to be cleared")
    }
}
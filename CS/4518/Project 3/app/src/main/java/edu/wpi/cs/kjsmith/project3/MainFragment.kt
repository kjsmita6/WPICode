package edu.wpi.cs.kjsmith.project3

import android.graphics.drawable.Drawable
import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import android.widget.Toast
import androidx.core.content.res.ResourcesCompat
import androidx.lifecycle.ViewModelProviders
import edu.wpi.cs.kjsmith.project3.model.GameHistory
import edu.wpi.cs.kjsmith.project3.model.ScoreViewModel

class MainFragment : Fragment() {

    lateinit var COURT_BLANK: Drawable
    lateinit var COURT_3: Drawable
    lateinit var COURT_2: Drawable
    lateinit var COURT_1: Drawable

    lateinit var model : ScoreViewModel

    val TAG: String = "MainFragment"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        model = ViewModelProviders.of(this).get(ScoreViewModel::class.java)

        COURT_BLANK = ResourcesCompat.getDrawable(resources, R.drawable.court_blank, null)!!
        COURT_3 = ResourcesCompat.getDrawable(resources, R.drawable.court_3pt, null)!!
        COURT_2 = ResourcesCompat.getDrawable(resources, R.drawable.court_2pt, null)!!
        COURT_1 = ResourcesCompat.getDrawable(resources, R.drawable.court_1pt, null)!!
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val view: View = inflater.inflate(R.layout.fragment_main, container, false)

        if (arguments != null) {
            val thanksTino: Boolean = arguments!!.getBoolean(TinoFragment.THANKS_TINO)
            if (thanksTino) {
                Toast.makeText(context, "Tino wishes you good luck on your next game!", Toast.LENGTH_SHORT).show()
            } else {
                Toast.makeText(context, "Tino says you are the meanest human he has ever met!", Toast.LENGTH_SHORT).show()
            }
        }

        val score_A = view.findViewById(R.id.score_A) as TextView
        val score_B = view.findViewById(R.id.score_B) as TextView
        setNum(score_A, model.scoreA)
        setNum(score_B, model.scoreB)

        val btn_A_3 = view.findViewById(R.id.btn_A_3) as Button
        val btn_A_2 = view.findViewById(R.id.btn_A_2) as Button
        val btn_A_1 = view.findViewById(R.id.btn_A_1) as Button

        val btn_B_3 = view.findViewById(R.id.btn_B_3) as Button
        val btn_B_2 = view.findViewById(R.id.btn_B_2) as Button
        val btn_B_1 = view.findViewById(R.id.btn_B_1) as Button

        val btn_reset = view.findViewById(R.id.btn_reset) as Button

        val saveBtn = view.findViewById<Button>(R.id.saveBtn)
        saveBtn.setOnClickListener {
            val history: GameHistory = GameHistory()
            val frag = GameHistoryFragment()
            activity?.supportFragmentManager?.beginTransaction()?.replace(R.id.fragment, frag)?.addToBackStack(null)?.commit()
        }

        val court_image = view.findViewById(R.id.imageView) as ImageView
        when (model.lastPoint) {
            0 -> court_image.setImageDrawable(COURT_BLANK)
            1 -> court_image.setImageDrawable(COURT_1)
            2 -> court_image.setImageDrawable(COURT_2)
            3 -> court_image.setImageDrawable(COURT_3)
            else -> {
                Log.w(TAG, "Unexpected lastPoint " + model.lastPoint)
            }
        }

        btn_reset.setOnClickListener {
            setNum(score_A, 0)
            setNum(score_B, 0)
            model.lastPoint = 0
            court_image.setImageDrawable(COURT_BLANK)
        }

        btn_A_3.setOnClickListener {
            addNum(score_A, 3)
            court_image.setImageDrawable(COURT_3)
        }

        btn_A_2.setOnClickListener {
            addNum(score_A, 2)
            court_image.setImageDrawable(COURT_2)
        }

        btn_A_1.setOnClickListener {
            addNum(score_A, 1)
            court_image.setImageDrawable(COURT_1)
        }

        btn_B_3.setOnClickListener {
            addNum(score_B, 3)
            court_image.setImageDrawable(COURT_3)
        }

        btn_B_2.setOnClickListener {
            addNum(score_B, 2)
            court_image.setImageDrawable(COURT_2)
        }

        btn_B_1.setOnClickListener {
            addNum(score_B, 1)
            court_image.setImageDrawable(COURT_1)
        }

        return view
    }

    fun addNum(score: TextView, num: Int) {
        setNum(score, Integer.parseInt(score.text.toString()) + num)
        model.lastPoint = num
    }

    fun setNum(score: TextView, num: Int) {
        if (score.id.equals(R.id.score_A)) {
            model.scoreA = num
        } else if (score.id.equals(R.id.score_B)) {
            model.scoreB = num
        } else {
            Log.w(TAG, "Unexpected TextView ID " + score.id)
        }
        score.text = num.toString()
    }
}
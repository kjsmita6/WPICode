package edu.wpi.cs.kjsmith.basketballcounter

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
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import edu.wpi.cs.kjsmith.basketballcounter.model.GameHistory
import edu.wpi.cs.kjsmith.basketballcounter.model.ScoreViewModel
import edu.wpi.cs.kjsmith.basketballcounter.model.Table_Game
import java.util.*

class MainFragment : Fragment() {

    companion object {
        val TEAM_A_WINNER: String = "edu.wpi.cs.kjsmith.basketballcounter.MainFragment.TEAM_A_WINNER"
        val gameRepository: GameRepository = GameRepository.get()
    }

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

        val score_A = view.findViewById(R.id.score_A) as TextView
        val score_B = view.findViewById(R.id.score_B) as TextView

        val teamA = view.findViewById(R.id.teamA) as TextView
        val teamB = view.findViewById(R.id.teamB) as TextView

        val btn_A_3 = view.findViewById(R.id.btn_A_3) as Button
        val btn_A_2 = view.findViewById(R.id.btn_A_2) as Button
        val btn_A_1 = view.findViewById(R.id.btn_A_1) as Button

        val btn_B_3 = view.findViewById(R.id.btn_B_3) as Button
        val btn_B_2 = view.findViewById(R.id.btn_B_2) as Button
        val btn_B_1 = view.findViewById(R.id.btn_B_1) as Button

        val btn_reset = view.findViewById(R.id.btn_reset) as Button

        if (arguments != null) {
            setNum(score_A, arguments?.getInt(GameHistoryFragment.GameHolder.TEAM_A_SCORE)!!)
            setNum(score_B, arguments?.getInt(GameHistoryFragment.GameHolder.TEAM_B_SCORE)!!)
            setTeamName(teamA, arguments?.getString(GameHistoryFragment.GameHolder.TEAM_A_NAME)!!)
            setTeamName(teamB, arguments?.getString(GameHistoryFragment.GameHolder.TEAM_B_NAME)!!)
        } else {
            setNum(score_A, model.scoreA)
            setNum(score_B, model.scoreB)
            setTeamName(teamA, model.teamA)
            setTeamName(teamB, model.teamB)
        }
        val displayBtn = view.findViewById<Button>(R.id.displayBtn)
        val saveBtn = view.findViewById<Button>(R.id.saveBtn)

        displayBtn.setOnClickListener {
            saveBtn.callOnClick()
            val history: GameHistory = GameHistory()
            val frag = GameHistoryFragment()
            val args: Bundle = Bundle()
            if (Integer.parseInt(score_A.text as String) >= Integer.parseInt(score_B.text as String)) {
                args.putBoolean(TEAM_A_WINNER, true)
            } else {
                args.putBoolean(TEAM_A_WINNER, false)
            }
            frag.arguments = args
            Log.d(TAG, "Display button pressed, beginning transaction")
            activity?.supportFragmentManager?.beginTransaction()?.replace(R.id.fragment, frag)?.addToBackStack(null)?.commit()
        }

        saveBtn.setOnClickListener {
            val uuid: String? = arguments?.getString(GameHistoryFragment.GameHolder.GAME_ID)
            model.teamA = teamA.text.toString()
            model.teamB = teamB.text.toString()
            var newGame: Boolean = true
            val g: Table_Game = Table_Game(
                model.teamA,
                model.teamB,
                model.scoreA,
                model.scoreB,
                Date()
            )

            if (uuid != null) {
                gameRepository.getMatchingGames(uuid)
                    .observe(viewLifecycleOwner, Observer { count ->
                        count?.let {
                            if (it != 0) {
                                newGame = false
                            }
                        }
                    })
            }

            if (newGame) {
                gameRepository.addGame(g)
            } else {
                if (uuid != null) {
                    g.id = UUID.fromString(uuid)
                }
                gameRepository.updateGame(g)
            }

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

    fun setTeamName(team: TextView, name: String) {
        if (team.id.equals(R.id.teamA)) {
            model.teamA = name
        } else if (team.id.equals(R.id.teamB)) {
            model.teamB = name
        } else {
            Log.w(TAG, "Unexpected TextView ID " + team.id)
        }
        team.text = name
    }
}
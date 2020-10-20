package edu.wpi.cs.kjsmith.basketballcounter

import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.res.ResourcesCompat
import androidx.lifecycle.LiveData
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import edu.wpi.cs.kjsmith.basketballcounter.model.Table_Game
import edu.wpi.cs.kjsmith.basketballcounter.model.GameHistory
import kotlin.collections.List as List

class GameHistoryFragment : Fragment() {

    private var adapter: GameAdapter? = null
    private lateinit var gameRecyclerView: RecyclerView
    private val TAG: String = "GameHistoryFragment"
    private var teamAWinner: Boolean = true

    private val gameHistory: GameHistory = GameHistory()

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        Log.d(TAG, "In onCreateView")
        val view: View = inflater.inflate(R.layout.fragment_game_history, container, false)
        gameRecyclerView = view.findViewById(R.id.gameList)
        gameRecyclerView.layoutManager = LinearLayoutManager(context)
        teamAWinner = arguments?.getBoolean(MainFragment.TEAM_A_WINNER)!!
        return view
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        if (teamAWinner) {
            gameHistory.getAGames().observe(viewLifecycleOwner, { games ->
                games?.let {
                    Log.d(TAG, "Got ${games.size} A games")
                    updateUI(games)
                }
            })
        } else {
            gameHistory.getBGames().observe(viewLifecycleOwner, Observer { games ->
                games?.let {
                    Log.d(TAG, "Got ${games.size} B games")
                    updateUI(games)
                }
            })
        }
    }
    private fun updateUI(games: List<Table_Game>) {
        /*
        if (teamAWinner) {
            games = gameHistory.getAGames()
        } else {
            games = gameHistory.getBGames()
        }
         */
        adapter = GameAdapter(games)
        gameRecyclerView.adapter = adapter
    }

    class GameHolder(view: View) : RecyclerView.ViewHolder(view) {
        val dateView: TextView = itemView.findViewById(R.id.game_time)
        val teamView: TextView = itemView.findViewById(R.id.teams)
        val scoreView: TextView = itemView.findViewById(R.id.scores)
        val winningTeam: ImageView = itemView.findViewById(R.id.winningTeam)

        lateinit var game: Table_Game

        val TAG: String = "GameHolder"
        companion object {
            private val BASE: String = "edu.wpi.cs.kjsmith.basketballcounter.GameHistoryFragment.GameHolder"
            val TEAM_A_NAME: String = BASE + ".TEAM_A_NAME"
            val TEAM_B_NAME: String = BASE + ".TEAM_B_NAME"
            val TEAM_A_SCORE: String = BASE + ".TEAM_A_SCORE"
            val TEAM_B_SCORE: String = BASE + ".TEAM_B_SCORE"
            val GAME_ID: String = BASE + ".GAME_ID"
        }

        init {
            view.setOnClickListener {
                val activity: AppCompatActivity = dateView.context as AppCompatActivity
                val main: Fragment = MainFragment()
                val args: Bundle = Bundle()
                args.putString(TEAM_A_NAME, game.teamAName)
                args.putString(TEAM_B_NAME, game.teamBName)
                args.putInt(TEAM_A_SCORE, game.teamAScore)
                args.putInt(TEAM_B_SCORE, game.teamBScore)
                args.putString(GAME_ID, game.id.toString())
                main.arguments = args
                activity.supportFragmentManager.beginTransaction().replace(R.id.fragment, main).addToBackStack(null).commit()
            }
        }
    }

    private inner class GameAdapter(val games: List<Table_Game>?): RecyclerView.Adapter<GameHolder>() {

        private val TAG: String = "GameAdapter"

        override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): GameHolder {
            Log.d(TAG, "In onCreateViewHolder")
            val view: View = layoutInflater.inflate(R.layout.list_item_game, parent, false)
            return GameHolder(view)
        }

        override fun onBindViewHolder(holder: GameHolder, position: Int) {
            Log.d(TAG, "In onBindViewHolder")
            val game: Table_Game? = games?.get(position)
            holder.apply {
                this.game = game!!
                dateView.text = getString(R.string.fmt_date, position + 1, game.date.toString())
                teamView.text = getString(R.string.fmt_teams, game.teamAName, game.teamBName)
                scoreView.text = getString(R.string.fmt_score, game.teamAScore, game.teamBScore)
                if (game.teamAScore >= game.teamBScore) {
                    winningTeam.setImageDrawable(ResourcesCompat.getDrawable(resources, R.drawable.bulls, null))
                } else {
                    winningTeam.setImageDrawable(ResourcesCompat.getDrawable(resources, R.drawable.celtics, null))
                }
            }
        }

        override fun getItemCount(): Int {
            Log.d(TAG, "In getItemCount")
            if (games == null) {
                return 0
            } else {
                return games.size
            }
        }
    }
}
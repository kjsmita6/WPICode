package edu.wpi.cs.kjsmith.project3

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.lifecycle.ViewModelProviders
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import edu.wpi.cs.kjsmith.project3.model.Game
import edu.wpi.cs.kjsmith.project3.model.GameHistory

class GameHistoryFragment : Fragment() {

    private var adapter: GameAdapter? = null
    private lateinit var gameRecyclerView: RecyclerView

    private val gameHistory: GameHistory by lazy {
        ViewModelProviders.of(this).get(GameHistory::class.java)
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
       val view: View = inflater.inflate(R.layout.fragment_game_history, container, false)
        gameRecyclerView = view.findViewById(R.id.gameList)
        gameRecyclerView.layoutManager = LinearLayoutManager(context)
        updateUI()
        return view
    }

    private fun updateUI() {
        val games: Array<Game?> = gameHistory.games
        adapter = GameAdapter(games)
        gameRecyclerView.adapter = adapter
    }

    private inner class GameHolder(view: View) : RecyclerView.ViewHolder(view) {
        val dateView: TextView = itemView.findViewById(R.id.game_time)
        val teamView: TextView = itemView.findViewById(R.id.teams)
        val scoreView: TextView = itemView.findViewById(R.id.scores)
    }

    private inner class GameAdapter(val games: Array<Game?>): RecyclerView.Adapter<GameHolder>() {

        override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): GameHolder {
            val view: View = layoutInflater.inflate(R.layout.list_item_game, parent, false)
            return GameHolder(view)
        }

        override fun onBindViewHolder(holder: GameHolder, position: Int) {
            val game: Game? = games[position]
            holder.apply {
                dateView.text = "Game #" + game?.index + " -- " + game?.time.toString()
                teamView.text = game?.formatTeams()
                scoreView.text = game?.formatScores()
            }
        }

        override fun getItemCount(): Int {
            return games.size
        }

    }
}
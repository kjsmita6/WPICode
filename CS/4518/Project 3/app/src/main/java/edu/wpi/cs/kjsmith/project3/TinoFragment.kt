package edu.wpi.cs.kjsmith.project3

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button

// TODO: Rename parameter arguments, choose names that match
// the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
private const val ARG_PARAM1 = "param1"
private const val ARG_PARAM2 = "param2"

/**
 * A simple [Fragment] subclass.
 * Use the [TinoFragment.newInstance] factory method to
 * create an instance of this fragment.
 */
class TinoFragment : Fragment() {

    companion object {
        val THANKS_TINO: String = "edu.wpi.cs.kjsmith.project3.TinoFragment.THANKS_TINO"
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val view: View = inflater.inflate(R.layout.fragment_tino, container, false)
        val thankBtn: Button = view.findViewById<Button>(R.id.thanks_tino)
        val talkingBtn: Button = view.findViewById<Button>(R.id.talking_dog)

        thankBtn.setOnClickListener {
            setThanksTino(true)
        }

        talkingBtn.setOnClickListener {
            setThanksTino(false)
        }
        return view
    }

    fun setThanksTino(thanks: Boolean) {
        val bundle: Bundle = Bundle()
        bundle.putBoolean(THANKS_TINO, thanks)
        val frag: MainFragment = MainFragment()
        frag.arguments = bundle
        activity?.supportFragmentManager?.beginTransaction()?.replace(R.id.fragment, frag)?.addToBackStack(null)?.commit()
    }
}
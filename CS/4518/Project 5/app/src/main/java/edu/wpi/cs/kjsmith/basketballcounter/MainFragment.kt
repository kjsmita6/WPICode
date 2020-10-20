package edu.wpi.cs.kjsmith.basketballcounter

import android.app.Activity
import android.content.Intent
import android.content.pm.PackageManager
import android.content.pm.ResolveInfo
import android.content.res.AssetManager
import android.graphics.drawable.Drawable
import android.media.MediaPlayer
import android.net.Uri
import android.os.Bundle
import android.provider.MediaStore
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.FileProvider
import androidx.core.content.res.ResourcesCompat
import androidx.lifecycle.LiveData
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import edu.wpi.cs.kjsmith.basketballcounter.model.Game
import edu.wpi.cs.kjsmith.basketballcounter.model.ScoreViewModel
import edu.wpi.cs.kjsmith.basketballcounter.sound.SoundController
import edu.wpi.cs.kjsmith.basketballcounter.weather.WeatherAPI
import edu.wpi.cs.kjsmith.basketballcounter.weather.WeatherRepository
import kotlinx.android.synthetic.main.fragment_main.*
import retrofit2.Call
import retrofit2.Retrofit
import retrofit2.converter.scalars.ScalarsConverterFactory
import java.io.File
import java.util.*

class MainFragment() : Fragment() {

    val gameRepository: GameRepository = GameRepository.get()
    val soundController: SoundController = SoundController.getInstance()
    lateinit var mediaPlayer: MediaPlayer


    lateinit var COURT_BLANK: Drawable
    lateinit var COURT_3: Drawable
    lateinit var COURT_2: Drawable
    lateinit var COURT_1: Drawable

    lateinit var model: ScoreViewModel

    private lateinit var photoFile: File
    private lateinit var photoUri: Uri

    val REQUEST_PHOTO_A = 1
    val REQUEST_PHOTO_B = 2

    lateinit var teamAImage: ImageView
    lateinit var teamBImage: ImageView

    val TAG: String = "MainFragment"

    private fun convertKToF(temp: Double): Double {
        return (temp - 273.15) * (9/5.0) + 32
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        model = ViewModelProviders.of(this).get(ScoreViewModel::class.java)
        model.game = Game(UUID.randomUUID(), "Team A", "Team B", 0, 0, Date())

        COURT_BLANK = ResourcesCompat.getDrawable(resources, R.drawable.court_blank, null)!!
        COURT_3 = ResourcesCompat.getDrawable(resources, R.drawable.court_3pt, null)!!
        COURT_2 = ResourcesCompat.getDrawable(resources, R.drawable.court_2pt, null)!!
        COURT_1 = ResourcesCompat.getDrawable(resources, R.drawable.court_1pt, null)!!

        mediaPlayer = MediaPlayer.create(context, R.raw.sound)
        soundController.loadSounds()
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        photoFile = gameRepository.getPhotoFile(model.game)
        photoUri = FileProvider.getUriForFile(requireActivity(), "edu.wpi.cs.kjsmith.basketballcounter.fileprovider", photoFile)
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

        val weatherText = view.findViewById<TextView>(R.id.weatherText)
        val weatherLD = WeatherRepository().fetchContents()
        weatherLD.observe(viewLifecycleOwner, { response ->
            weatherText.text = "${response.name}: ${convertKToF(response.main.temp)} degrees Fahrenheit"
        })

        setNum(score_A, model.game.teamAScore)
        setNum(score_B, model.game.teamBScore)
        setTeamName(teamA, model.game.teamAName)
        setTeamName(teamB, model.game.teamBName)

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

        val teamASoundButton = view.findViewById<Button>(R.id.teamASoundButton)
        val teamBSoundButton = view.findViewById<Button>(R.id.teamBSoundButton)
        teamASoundButton.setOnClickListener {
            //soundController.play(soundController.sounds.get(0))
            mediaPlayer.start()
        }

        teamBSoundButton.setOnClickListener {
            soundController.play(soundController.sounds.get(1))
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

        val teamAImageButton = view.findViewById<Button>(R.id.teamAImageButton)
        val teamBImageButton = view.findViewById<Button>(R.id.teamBImageButton)
        teamAImage = view.findViewById<ImageView>(R.id.teamAImage)
        teamBImage = view.findViewById<ImageView>(R.id.teamBImage)

        teamAImageButton.apply {
            val packageManager: PackageManager = requireActivity().packageManager
            val captureImage = Intent(MediaStore.ACTION_IMAGE_CAPTURE)
            val resolvedActivity: ResolveInfo? = packageManager.resolveActivity(captureImage, PackageManager.MATCH_DEFAULT_ONLY)
            if (resolvedActivity == null) {
                isEnabled = false
            }
            setOnClickListener {
                captureImage.putExtra(MediaStore.EXTRA_OUTPUT, photoUri)
                val cameraActivities: List<ResolveInfo> = packageManager.queryIntentActivities(captureImage, PackageManager.MATCH_DEFAULT_ONLY)
                for (cameraActivity in cameraActivities) {
                    requireActivity().grantUriPermission(cameraActivity.activityInfo.packageName, photoUri, Intent.FLAG_GRANT_WRITE_URI_PERMISSION)
                }
                startActivityForResult(captureImage, REQUEST_PHOTO_A)
            }
        }

        teamBImageButton.apply {
            val packageManager: PackageManager = requireActivity().packageManager
            val captureImage = Intent(MediaStore.ACTION_IMAGE_CAPTURE)
            val resolvedActivity: ResolveInfo? = packageManager.resolveActivity(captureImage, PackageManager.MATCH_DEFAULT_ONLY)
            if (resolvedActivity == null) {
                isEnabled = false
            }
            setOnClickListener {
                captureImage.putExtra(MediaStore.EXTRA_OUTPUT, photoUri)
                val cameraActivities: List<ResolveInfo> = packageManager.queryIntentActivities(captureImage, PackageManager.MATCH_DEFAULT_ONLY)
                for (cameraActivity in cameraActivities) {
                    requireActivity().grantUriPermission(cameraActivity.activityInfo.packageName, photoUri, Intent.FLAG_GRANT_WRITE_URI_PERMISSION)
                }
                startActivityForResult(captureImage, REQUEST_PHOTO_B)
            }
        }

        return view
    }

    override fun onDetach() {
        super.onDetach()
        requireActivity().revokeUriPermission(photoUri, Intent.FLAG_GRANT_WRITE_URI_PERMISSION)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        when {
            resultCode != Activity.RESULT_OK -> return
            requestCode == REQUEST_PHOTO_A -> {
                updatePhotoView(teamAImage)
            }
            requestCode == REQUEST_PHOTO_B -> {
                updatePhotoView(teamBImage)
            }
            else -> {
                Log.w(TAG, "Unexpected request code " + requestCode)
            }
        }
    }

    fun updatePhotoView(photoView: ImageView) {
        if (photoFile.exists()) {
            var bitmap = PictureUtils.getScaledBitmap(photoFile.path, requireActivity())
            bitmap = PictureUtils.correctRotation(photoFile, bitmap)
            photoView.setImageBitmap(bitmap)
        } else {
            photoView.setImageDrawable(null)
        }
    }

    fun addNum(score: TextView, num: Int) {
        setNum(score, Integer.parseInt(score.text.toString()) + num)
        model.lastPoint = num
    }

    fun setNum(score: TextView, num: Int) {
        if (score.id.equals(R.id.score_A)) {
            model.game.teamAScore = num
        } else if (score.id.equals(R.id.score_B)) {
            model.game.teamBScore = num
        } else {
            Log.w(TAG, "Unexpected TextView ID " + score.id)
        }
        score.text = num.toString()
    }

    fun setTeamName(team: TextView, name: String) {
        if (team.id.equals(R.id.teamA)) {
            model.game.teamAName = name
        } else if (team.id.equals(R.id.teamB)) {
            model.game.teamBName = name
        } else {
            Log.w(TAG, "Unexpected TextView ID " + team.id)
        }
        team.text = name
    }
}
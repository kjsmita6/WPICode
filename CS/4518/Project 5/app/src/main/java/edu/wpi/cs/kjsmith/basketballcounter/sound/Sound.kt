package edu.wpi.cs.kjsmith.basketballcounter.sound

private const val WAV = ".wav"

class Sound(val assetPath: String, var soundId: Int? = null) {

    val name = assetPath.split("/").last().removeSuffix(WAV)
}
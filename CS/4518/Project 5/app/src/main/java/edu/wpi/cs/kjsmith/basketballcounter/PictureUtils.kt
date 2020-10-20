package edu.wpi.cs.kjsmith.basketballcounter

import android.app.Activity
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Matrix
import android.graphics.Point
import android.media.ExifInterface
import java.io.File

class PictureUtils {

    companion object {

        fun getScaledBitmap(path: String, destWidth: Int, destHeight: Int): Bitmap {
            var options = BitmapFactory.Options()
            options.inJustDecodeBounds = true
            BitmapFactory.decodeFile(path, options)
            val srcWidth = options.outWidth.toFloat()
            val srcHeight = options.outHeight.toFloat()
            var inSampleSize = 1
            if (srcHeight > destHeight || srcWidth > destWidth) {
                val heightScale = srcHeight / destHeight
                val widthScale = srcWidth / destWidth
                val sampleScale = if (heightScale > widthScale) {
                    heightScale
                } else {
                    widthScale
                }
                inSampleSize = Math.round(sampleScale)
            }
            options = BitmapFactory.Options()
            options.inSampleSize = inSampleSize
            return BitmapFactory.decodeFile(path, options)
        }

        fun getScaledBitmap(path: String, activity: Activity): Bitmap {
            val size = Point()
            activity.windowManager.defaultDisplay.getSize(size)
            return getScaledBitmap(path, size.x, size.y)
        }

        fun correctRotation(file: File, bmp: Bitmap): Bitmap {
            val exif = ExifInterface(file.path)
            val orientation = exif.getAttributeInt(ExifInterface.TAG_ORIENTATION, ExifInterface.ORIENTATION_NORMAL)
            var angle: Float = 0F
            when {
                orientation == ExifInterface.ORIENTATION_ROTATE_90 -> angle = 90F
                orientation == ExifInterface.ORIENTATION_ROTATE_180 -> angle = 180F
                orientation == ExifInterface.ORIENTATION_ROTATE_270 -> angle = 270F
            }
            val matrix: Matrix = Matrix()
            matrix.postRotate(angle)
            return Bitmap.createBitmap(bmp, 0, 0, bmp.width, bmp.height, matrix, true)
        }
    }
}
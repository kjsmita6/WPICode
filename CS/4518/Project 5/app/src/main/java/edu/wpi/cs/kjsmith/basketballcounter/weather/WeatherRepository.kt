package edu.wpi.cs.kjsmith.basketballcounter.weather

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.converter.scalars.ScalarsConverterFactory
import java.util.*

class WeatherRepository {

    private val weatherAPI: WeatherAPI
    private val TAG: String = "WeatherRepository"

    init {
        val retrofit: Retrofit = Retrofit.Builder().baseUrl("https://api.openweathermap.org/data/2.5/").addConverterFactory(
            GsonConverterFactory.create()).build()
        weatherAPI = retrofit.create(WeatherAPI::class.java)
    }

    fun fetchContents(): LiveData<WeatherResponse> {
        val responseLD: MutableLiveData<WeatherResponse> = MutableLiveData()
        val request: Call<WeatherResponse> = weatherAPI.fetchContents()
        request.enqueue(object: Callback<WeatherResponse> {
            override fun onFailure(call: Call<WeatherResponse>, t: Throwable) {
                Log.e(TAG, "Failed to fetch weather", t)
            }

            override fun onResponse(call: Call<WeatherResponse>, response: Response<WeatherResponse>) {
                Log.d(TAG, "Response received: " + response.body())
                responseLD.value = response.body()
            }
        })
        return responseLD
    }
}
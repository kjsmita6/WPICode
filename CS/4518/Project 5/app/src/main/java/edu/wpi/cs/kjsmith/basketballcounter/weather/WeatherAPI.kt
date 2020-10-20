package edu.wpi.cs.kjsmith.basketballcounter.weather

import retrofit2.Call
import retrofit2.http.GET

interface WeatherAPI {

    @GET("weather?q=worcester&appid=5e9cd8b71d0f2015283593725f5e240c")
    fun fetchContents(): Call<WeatherResponse>

}
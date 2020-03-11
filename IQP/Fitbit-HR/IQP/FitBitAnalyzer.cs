using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Http;
using Newtonsoft.Json;
using System.Text;
using System.Threading.Tasks;
using System.Web;

using Fitbit.Api.Portable;
using Fitbit.Models;
using Fitbit.Api.Portable.OAuth2;

namespace IQP
{
    public class FitBitAnalyzer
    {
        private FitbitClient Client;
        public string ClientId { get; set; }
        public string ClientSecret { get; set; }
        public string[] Scopes { get; set; }
        public string RedirectUri { get; set; }
        public string Base64 { get; set; }
        public HeartRateResponse HRResponse { get; set; }

        public FitBitAnalyzer(string clientId, string clientSecret, string[] scopes, string redirectUri)
        {
            ClientId = clientId;
            ClientSecret = clientSecret;
            Scopes = scopes;
            RedirectUri = redirectUri;

            string toConvert = ClientId + ":" + ClientSecret;
            byte[] bytes = Encoding.UTF8.GetBytes(toConvert);
            Base64 = Convert.ToBase64String(bytes);
        }

        public void Initialize()
        {
            FitbitAppCredentials credentials = new FitbitAppCredentials()
            {
                ClientId = ClientId,
                ClientSecret = ClientSecret
            };
            OAuth2Helper helper = new OAuth2Helper(credentials, RedirectUri);
            string authUrl = helper.GenerateAuthUrl(Scopes);

            Process.Start(authUrl);
            Console.Write("Code (do not include #_=_): ");
            string code = Console.ReadLine();
            Console.WriteLine();

            string requestUri = string.Format(@"https://api.fitbit.com/oauth2/token?code={0}&grant_type={1}&redirect_uri={2}&client_id={3}",
                                    code, "authorization_code", RedirectUri, ClientId);
            using (HttpClient httpClient = new HttpClient())
            {
                httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Basic", Base64);
                using (HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Post, requestUri))
                {
                    Dictionary<string, string> content_type = new Dictionary<string, string>();
                    content_type.Add("Content-Type", "application/x-www-form-urlencoded");
                    request.Content = new FormUrlEncodedContent(content_type);
                    using (HttpResponseMessage response = Task.Run(() => httpClient.SendAsync(request)).Result)
                    {
                        string body = Task.Run(() => response.Content.ReadAsStringAsync()).Result;
                        AccessTokenResponse tokenResp = JsonConvert.DeserializeObject<AccessTokenResponse>(body);
                        OAuth2AccessToken token = new OAuth2AccessToken()
                        {
                            ExpiresIn = tokenResp.expires_in,
                            RefreshToken = tokenResp.refresh_token,
                            Token = tokenResp.access_token,
                            TokenType = tokenResp.token_type,
                            UserId = tokenResp.user_id,
                            Scope = tokenResp.scope
                        };
                        Client = new FitbitClient(credentials, token, false);
                    }
                }
            }
        }

        public async Task<HeartRateResponse> GetHeartRate()
        {

            string url = "https://api.fitbit.com/1/user/-/activities/heart/date/{0}/1d/1sec.json";
            Console.Write("Date (yyyy-MM-dd): ");
            string date = Console.ReadLine();
            Console.WriteLine();
            string response = await Client.GetApiFreeResponseAsync(string.Format(url, date));
            //Console.WriteLine(response);
            HeartRateResponse hr = await Task.Factory.StartNew(() => JsonConvert.DeserializeObject<HeartRateResponse>(response));
            return hr;
        }
    }

    public class AccessTokenResponse
    {
        public string access_token { get; set; }
        public int expires_in { get; set; }
        public string refresh_token { get; set; }
        public string scope { get; set; }
        public string token_type { get; set; }
        public string user_id { get; set; }
    }

    public class HeartRateResponse
    {
        [JsonProperty(PropertyName = "activities-heart")]
        public ActivitiesHeart[] activitiesheart { get; set; }

        [JsonProperty(PropertyName = "activities-heart-intraday")]
        public ActivitiesHeartIntraday activitiesheartintraday { get; set; }
    }

    public class ActivitiesHeartIntraday
    {
        public Dataset[] dataset { get; set; }
        public int datasetInterval { get; set; }
        public string datasetType { get; set; }
    }

    public class Dataset
    {
        public string time { get; set; }
        public int value { get; set; }
    }

    public class ActivitiesHeart
    {
        public ActivitiesHeartValue value { get; set; }
        public string dateTime { get; set; }
    }

    public class ActivitiesHeartValue
    {
        public object[] customHeartRateZones { get; set; }
        public Heartratezone[] heartRateZones { get; set; }
        public int restingHeartRate { get; set; }
    }


    public class Heartratezone
    {
        public float caloriesOut { get; set; }
        public int max { get; set; }
        public int min { get; set; }
        public int minutes { get; set; }
        public string name { get; set; }
    }

}
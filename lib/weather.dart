


class Weather {
  String cloud_amount,name;
  String air_t;
  Weather({this.cloud_amount,this.name,this.air_t,});
  /*factory Weather.fromJson(Map<String, dynamic> json){
    if(json ==null){
      return null;
    } else {
      return Weather(json["cloud_amount"],json["name"],json["air_t"]);
    }
  }
  get cloud_amount => this._cloud_amount;
  get  name  => this._name;
  get  air_t  => this._air_t;*/
}
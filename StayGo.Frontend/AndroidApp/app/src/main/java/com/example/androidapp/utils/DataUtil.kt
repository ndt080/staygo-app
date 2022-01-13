package com.example.androidapp.utils

import android.net.Uri
import android.widget.ImageView
import androidx.databinding.BindingAdapter
import com.bumptech.glide.Glide
import com.example.androidapp.models.Bar

val data = mutableListOf<Bar>();

class DataUtil {
    val bars = data;

    fun setBars(bars: Array<Bar>) {
        data.addAll(bars);
    }
}

@BindingAdapter("app:imageUri")
fun loadImageWithUri(imageView: ImageView, imageUri: String){
    Glide.with(imageView.context).load(Uri.parse(imageUri)).into(imageView)
}

//Bar(
//id = 0,
//name = "Раковский Бровар",
//image = "https://alterainvest.ru/upload/iblock/8ac/8acbff025985ec1b48c3b0fdd17189c4.jpg",
//address = "Минск, ул.Витебская, д.10",
//description = "Первый пивной ресторан в Беларуси интересен по трем причинам. Первая — это ресторан-пивоварня, где делают 6 сортов живого пива. Вторая — «Раковский Бровар» разместился в историческом центре Минска, в Раковском предместье. И третья — здесь подают традиционные блюда национальной кухни, а также классику европейской. Так что белорусам здесь вкусно, а туристам еще и интересно.",
//type = "Пивной ресторан",
//rating = 4,
//avgPayCheck = 25.5,
//locationX = 53.904254,
//locationY = 27.548701,
//),
//Bar(
//id = 2,
//name = "Спички бар",
//image = "https://mir-s3-cdn-cf.behance.net/project_modules/disp/54924c4651215.5601f36ba1e93.jpg",
//address = "ул. Комсомольская 5а, Минск",
//description = "Spichki — демократичный бар в самом центре Минска, на Комсомольской 5а. Он понравится тем, кто любит стильные места, вечеринки, street food и интересные напитки. Упор в баре делают на настойки и коктейли, но предложить могут и многое другое.",
//type = "Коктейль-бар",
//rating = 4,
//avgPayCheck = 15.0,
//locationX = 53.903566960502175,
//locationY = 27.551937857796666,
//)
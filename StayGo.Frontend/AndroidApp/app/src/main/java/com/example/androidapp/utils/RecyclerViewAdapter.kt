import com.example.androidapp.R
import android.view.View
import androidx.cardview.widget.CardView
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import android.view.LayoutInflater
import android.view.ViewGroup
import android.widget.Filter
import com.example.androidapp.models.Bar
import com.example.androidapp.utils.DataUtil

import com.example.androidapp.utils.loadImageWithUri
import java.util.ArrayList

class RecyclerViewAdapter internal constructor(private var barList: List<Bar>,  private val listener: (Bar) -> Unit) :
    RecyclerView.Adapter<RecyclerViewAdapter.MyViewHolder>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MyViewHolder {
        val view: View = LayoutInflater.from(parent.context)
            .inflate(R.layout.recyclerview_adapter_layout, parent, false)
        return MyViewHolder(view)
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {
        val bar = barList[position]
        holder.title.text = bar.name
        loadImageWithUri(holder.image, bar.image)
        holder.itemView.setOnClickListener { listener(bar) }
    }

    override fun getItemCount(): Int {
        return barList.size
    }

    inner class MyViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val title: TextView
        val image: ImageView
        private val cardView: CardView

        init {
            title = itemView.findViewById(R.id.title)
            image = itemView.findViewById(R.id.image)
            cardView = itemView.findViewById(R.id.carView)
        }
    }

    fun getFilter(): Filter {
        return object : Filter() {
            override fun publishResults(constraint: CharSequence?, results: FilterResults) {
                barList = results.values as List<Bar>;
                notifyDataSetChanged()
            }

            override fun performFiltering(constraint: CharSequence): FilterResults {
                val filteredResults = getFilteredResults(constraint.toString().toLowerCase())
                val results = FilterResults()
                results.values = filteredResults
                return results;
            }
        }
    }

    protected fun getFilteredResults(constraint: String): List<Bar> {
        return DataUtil().bars.filter { it.name.toLowerCase().contains(constraint.toLowerCase()) }
    }
}
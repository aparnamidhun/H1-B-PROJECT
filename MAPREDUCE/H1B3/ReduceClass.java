

import java.io.IOException;
import java.util.TreeMap;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class ReduceClass extends Reducer<Text,IntWritable,NullWritable,Text>{
	private TreeMap<Integer,Text> highest = new TreeMap<>();
	public void reduce(Text key,Iterable<IntWritable> value,Context context) throws IOException, InterruptedException{
		int count = 0;
		for (IntWritable val:value){
			count += val.get();
		}
		String output = key.toString()+","+count;
		highest.put(count,new Text(output));
		if(highest.size()>1){
			highest.remove(highest.firstKey());
		}
	}
	protected void cleanup(Context context) throws IOException, InterruptedException{
		for(Text t:highest.values()){
			context.write(NullWritable.get(),t);
		}
	}
}


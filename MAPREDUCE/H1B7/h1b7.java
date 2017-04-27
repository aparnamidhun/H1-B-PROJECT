
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class h1b7
{
	public static void main(String args[]) throws Exception
	
	{
	Configuration conf = new Configuration();
	Job job = Job.getInstance(conf,"h1b7");
	
	job.setJarByClass(h1b7.class);
	job.setMapperClass(MapClass.class);
	job.setCombinerClass(ReduceClass.class);
	job.setReducerClass(ReduceClass.class);
	
	job.setMapOutputKeyClass(Text.class);
	job.setMapOutputValueClass(LongWritable.class);
	
	job.setOutputKeyClass(Text.class);
	job.setOutputValueClass(LongWritable.class);
	
	FileInputFormat.addInputPath(job, new Path(args[0]));
	FileOutputFormat.setOutputPath(job,new Path(args[1]));
	
	System.exit(job.waitForCompletion(true)?0:1);
		
	}
}

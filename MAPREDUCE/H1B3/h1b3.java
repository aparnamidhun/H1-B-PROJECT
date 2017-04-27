

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.mapreduce.Job;
import java.io.IOException;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;


public class h1b3 {
	
	
	public static void main(String[] args) throws IOException, ClassNotFoundException, InterruptedException{
		Configuration conf = new Configuration();
		  conf.set("mapreduce.output.textoutputformat.separator", ",");
		  Job job = Job.getInstance(conf, "h1b3");
		  job.setJarByClass(h1b3.class);
		  job.setMapperClass(MapClass.class);
		  job.setReducerClass(ReduceClass.class);
          job.setMapOutputKeyClass(Text.class);
		  job.setMapOutputValueClass(IntWritable.class);
		  job.setOutputKeyClass(NullWritable.class);
		  //job.setNumReduceTasks(0);
		  //job.setCombinerClass(ReduceClass.class);
		  job.setOutputValueClass(Text.class);
		  job.setInputFormatClass(TextInputFormat.class);
		  job.setOutputFormatClass(TextOutputFormat.class);
		  FileInputFormat.addInputPath(job, new Path(args[0]));
		  FileOutputFormat.setOutputPath(job, new Path(args[1]));
		  System.exit(job.waitForCompletion(true) ? 0 : 1);
	}

}
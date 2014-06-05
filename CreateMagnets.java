import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.File;

//1) Save to file
//2) LinePerLineProcessing? Think not possible
//3) Exclude files like .torrent, .md5, sha... Thinks not possible

public class CreateMagnets {
	public static void main(String[] args) throws IOException,
			InterruptedException {

		//Make it with args!!!
		
		if( args.length <= 1 ) System.out.println("Please, use java CreateMagnet /where/the/files/ file.to.save");
		else{

			String whereToScan = args[0];
			String saveToFile = args[1];

			File fileToSave = null; //File exist, overwrite?
			
			String[] trackers = { 	"udp://tracker.openbittorrent.com:80/announce",
						"udp://tracker.publicbt.com:80/announce",
						"http://tracker.openbittorrent.com:80/announce",
						"http://tracker.publicbt.com:80/announce",
						"udp://tracker.ccc.de/announce"
				    	    };
		
			String urlTracker = "";
		
			//Make trackers on the same line and correct format
			for(int i = 0; i < trackers.length; i++){
				if(i==0) urlTracker = urlTracker+"&tr="+trackers[i];
				else urlTracker = urlTracker+",&tr="+trackers[i];
			}
		
			//Launch rhash
			Process p = Runtime
				.getRuntime()
				.exec("rhash -r --magnet --btih "+whereToScan);
			p.waitFor();

			BufferedReader reader = new BufferedReader(new InputStreamReader(
				p.getInputStream()));

			String line = "";
			while ((line = reader.readLine()) != null) {
				System.out.println(line+urlTracker);
				System.out.println();
			}
		}
	}
}

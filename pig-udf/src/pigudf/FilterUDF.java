package pigudf;

import java.io.IOException;
import org.apache.pig.FilterFunc;
import org.apache.pig.data.Tuple;
public class FilterUDF extends FilterFunc {
	public Boolean exec(Tuple input) throws IOException {
		try {
			int objective = (int) input.get(0);
			int performence = (int)input.get(1);
			if ((int)((performence * 100)/objective) >= 80) {
				return true;
			}
			else {
				return false;
			}
		}
		catch (Exception e) {
			throw new IOException(e);
		}
	}	
}
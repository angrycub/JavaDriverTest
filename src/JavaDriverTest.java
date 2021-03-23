// This program is a trivial workload built to
// test Nomad's Java Driver.

import java.util.Map;
import java.util.Enumeration;
import java.util.Properties;

public class JavaDriverTest {
	public static void main(String[] args) {
		System.out.println("---BEGIN---"); 
		PrintArguments(args);
		PrintEnvironmentVariables();
		PrintSystemProperties2();
		System.out.println("---END---"); 
	}

	public static void PrintArguments(String[] args) {
		System.out.println("---BEGIN ARGUMENTS---"); 
		for (String arg : args) {
			System.out.println(arg);
		}
		System.out.println("---END ARGUMENTS---"); 
	}

	public static void PrintEnvironmentVariables() {
		System.out.println("---BEGIN ENVIRONMENT---"); 
		Map<String, String> env = System.getenv();
		for (String envName : env.keySet()) {
			System.out.format("%s=%s%n",
							  envName,
							  env.get(envName));
		}
		System.out.println("---END ENVIRONMENT---"); 
	}

	public static void PrintSystemProperties() {
		System.out.println("---BEGIN SYSTEM PROPERTIES---"); 
		Properties props = System.getProperties();
		props.list(System.out);
		System.out.println("---END SYSTEM PROPERTIES---"); 
	}

	public static void PrintSystemProperties2() {
		System.out.println("---BEGIN SYSTEM PROPERTIES---");
		Properties props = System.getProperties();
		Enumeration keys = props.propertyNames();

		while (keys.hasMoreElements()) {
			String key = (String) keys.nextElement();
			System.out.format("%s=%s%n",
							  key,
							  props.getProperty(key, "«undefined»"));
		}
		System.out.println("---END SYSTEM PROPERTIES---"); 
	}    
}


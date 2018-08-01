package com.jeecms.template;

import com.ponyjava.common.developer.ModuleGenerator;

public class CoreModuleGenerator {
	private static String packName = "com.jeecms.template";
	private static String fileName = "config_core.properties";

	public static void main(String[] args) {
		new ModuleGenerator(packName, fileName).generate();
	}
}

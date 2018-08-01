package com.jeecms.template;

import com.ponyjava.common.developer.ModuleGenerator;

public class ShopModuleGenerator {
	private static String packName = "com.jeecms.template";
	private static String fileName = "config_shop.properties";

	public static void main(String[] args) {
		new ModuleGenerator(packName, fileName).generate();
	}
}

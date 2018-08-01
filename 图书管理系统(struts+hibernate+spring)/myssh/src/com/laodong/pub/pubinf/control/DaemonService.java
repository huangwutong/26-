package com.laodong.pub.pubinf.control;

import java.util.Timer;

public class DaemonService {
    private static DaemonService service;

    /**
     * ʹ��Singletonģʽ������һ��ʵ����ͨ���޸����ʵ�����ﵽ֪ͨ�޸ĵ�Ŀ�ġ�
     * @return DaemonService DaemonServiceʵ����
     */
    public static DaemonService getInstance()
    {
        if (service == null)
        {
            service = new DaemonService();
        }
        return service;

    }

    /**
     * ˽�й��췽����ֻ����getInstance()�������ã���������ʱ���Ķ�����
     */
    private DaemonService()
    {
        run();
    }

    /**
     * ����Timer��Task��
     * �ѵ�һ��ִ��ʱ���ִ�����ڲ�ͬ������������뵽�˷���
     */
    private void run()
    {
    	
        Timer timer = new Timer();
        
        //ÿ��ִ��һ�ε�����
        StatTaskforDay statTask = new StatTaskforDay();
        timer.scheduleAtFixedRate(statTask, statTask.getFirstTime(), statTask.getPeriod());
        
        //ÿ��3����ִ��һ�ε�����
        StatTashfor3fz stat3 = new StatTashfor3fz();
        timer.scheduleAtFixedRate(stat3, stat3.getFirstTime(), stat3.getPeriod());
        
//      ÿ��15����ִ��һ�ε�����
        StatTashfor15fz stat15 = new StatTashfor15fz();
        timer.scheduleAtFixedRate(stat15, stat15.getFirstTime(), stat15.getPeriod());
//
//        //ִ��ValidChecker�ĵ���������
//        ValidTask validTask = new ValidTask();
//        timer.scheduleAtFixedRate(validTask, validTask.getFirstTime(), validTask.getPeriod());
//        //ִ����׼ȷ�ʵ�ͳ�ơ�
//        DayNicetyTask dayTask = new DayNicetyTask();
//        timer.scheduleAtFixedRate(dayTask, dayTask.getFirstTime(), dayTask.getPeriod());
////		ִ�еط��糧��׼ȷ�ʵ�ͳ�ơ�
//		PlantNicetyTask plantTask = new PlantNicetyTask();
//		timer.scheduleAtFixedRate(plantTask, plantTask.getFirstTime(), plantTask.getPeriod());
        //ִ��ͳ�Ʒ�����
        


//        //      ������Ԥ��
//        SSTLFTask sstlf = new SSTLFTask();
//        timer.schedule(sstlf, sstlf.getFirstTime(), sstlf.getPeriod());
//        
////      ִ��LoadFromCurTask�ĵ��������������ֵ�������
//        LoadFromCurTask loadTask = new LoadFromCurTask();
//        timer.scheduleAtFixedRate(loadTask, loadTask.getFirstTime(), loadTask.getPeriod());
//        
////      ִ��LoadFromCurWGTask�ĵ�����������������������
//        LoadFromCurWGTask loadWGTask = new LoadFromCurWGTask();
//        timer.scheduleAtFixedRate(loadWGTask, loadWGTask.getFirstTime(), loadWGTask.getPeriod());
//        
////      ִ��DecadeDayTask�ĵ���������ͳ��Ѯ��󸺺�
//        DecadeDayTask decade = new DecadeDayTask();
//        timer.scheduleAtFixedRate(decade, decade.getFirstTime(), decade.getPeriod());
//
////      ִ��WeatherConditionTask�ĵ���������ͳ��ʵ������
//        WeatherConditionTask weather = new WeatherConditionTask();
//        timer.scheduleAtFixedRate(weather, weather.getFirstTime(), weather.getPeriod());
//
//        
////      ִ��WeatherEachHourTask�ĵ���������ͳ����ʱ����
//        WeatherEachHourTask weatherEH = new WeatherEachHourTask();
//        timer.scheduleAtFixedRate(weatherEH, weatherEH.getFirstTime(), weatherEH.getPeriod());
//
////      ִ��WeatherToSenTask�ĵ���������ͳ�������ȷ���������
//        WeatherToSenTask weatherSen = new WeatherToSenTask();
//        timer.scheduleAtFixedRate(weatherSen, weatherSen.getFirstTime(), weatherSen.getPeriod());
//
////      ִ��LoadFromCurYesterDayTask�ĵ�������������ǰһ��ĸ���
//        LoadFromCurYesterDayTask curYesterday = new LoadFromCurYesterDayTask();
//        timer.scheduleAtFixedRate(curYesterday, curYesterday.getFirstTime(), curYesterday.getPeriod());
//        
////      ִ��DayEnergyTask�ĵ���������ͳ�Ƶ���
//        DayEnergyTask energy = new DayEnergyTask();
//        timer.scheduleAtFixedRate(energy, energy.getFirstTime(), energy.getPeriod());

    }
}

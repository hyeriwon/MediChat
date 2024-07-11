package kr.spring.schedule.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.schedule.vo.DayoffVO;

@Mapper
public interface ScheduleMapper {
	//정기휴무요일 가져오기
	@Select("SELECT doc_off FROM doctor_detail WHERE doc_num=#{doc_num}")
	public String getRegularDayoff(Long doc_num);
	
	//근무시작시간, 근무종료시간 가져오기
	@Select("SELECT doc_stime,doc_etime FROM doctor_detail WHERE doc_num=#{doc_num}")
	public Map<String,String> getWorkingHours(Long doc_num);
	
	//휴무시간 가져오기
	@Select("SELECT doff_time FROM dayoff WHERE doc_num=#{doc_num} AND doff_date=#{doff_date}")
	public List<String> getDayoffTimes(Long doc_num, String doff_date);
	// 휴무시간 추가
    @Insert("INSERT INTO dayoff (doc_num, doff_date, doff_time) VALUES (#{doc_num}, #{doff_date}, #{doff_time})")
    void insertDayoff(Long doc_num,String doff_date,String doff_time);

    // 휴무시간 삭제
    @Delete("DELETE FROM dayoff WHERE doc_num=#{doc_num} AND doff_date=#{doff_date} AND doff_time=#{doff_time}")
    void deleteDayoff(Long doc_num,String doff_date,String doff_time);
	
}

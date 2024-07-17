package kr.spring.reservation.service;

import java.util.List;
import java.util.Map;

import kr.spring.doctor.vo.DoctorVO;
import kr.spring.hospital.vo.HospitalVO;

public interface ReservationService {
	//병원진료시간 가져오기
	public HospitalVO getHosHours(Long hos_num);
	//특정 날짜와 시간에 근무하는 의사 가져오기
	public List<DoctorVO> getAvailableDoctors(Map<String, Object> params);
}

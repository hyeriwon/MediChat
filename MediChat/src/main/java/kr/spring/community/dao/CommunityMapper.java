package kr.spring.community.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.community.vo.CommunityFavVO;
import kr.spring.community.vo.CommunityReFavVO;
import kr.spring.community.vo.CommunityReplyVO;
import kr.spring.community.vo.CommunityVO;

@Mapper
public interface CommunityMapper {
	/*-----------------------------게시판글-----------------------------*/
	//게시판
	public List<CommunityVO> selectCommunityList (Map<String, Object> map);//목록
	public Integer selectRowCount(Map<String, Object> map);//개수
	public void insertCommunity(CommunityVO community);//등록
	@Select("SELECT * FROM cboard JOIN member USING(mem_num) LEFT OUTER JOIN member_detail USING(mem_num) WHERE cbo_num=#{cbo_num}")
	public CommunityVO selectCommunity(Long cbo_num); //상세
	public void updateCommunity(CommunityVO community);//수정
	@Delete("DELETE FROM cboard WHERE cbo_num=#{cbo_num}")
	public void deleteCommunity(Long cbo_num);//삭제
	
	//조회수
	@Update("UPDATE cboard SET cbo_hit=cbo_hit+1 WHERE cbo_num=#{cbo_num}")
	public void updateHit(Long cbo_num);
	
	/*---게시판 좋아요---*/
	@Select("SELECT * FROM cboard_fav WHERE cbo_num=#{cbo_num} AND mem_num=#{mem_num}")
	public CommunityFavVO selectFav(CommunityFavVO fav); //좋아요 목록
	@Select("SELECT COUNT(*) FROM cboard_fav WHERE cbo_num=#{cbo_num}")
	public Integer selectFavCount(Long cbo_num); //좋아요 개수
	@Insert("INSERT INTO cboard_fav (cbo_num,mem_num) VALUES(#{cbo_num},#{mem_num})")
	public void insertFav(CommunityFavVO fav);	//좋아요 처리
	@Delete("DELETE FROM cboard_fav WHERE cbo_num=#{cbo_num} AND mem_num=#{mem_num}")
	public void deleteFav(CommunityFavVO fav); //좋아요 삭제
	
	//게시판 삭제 시 좋아요 삭제
	@Delete("DELETE cboard_fav WHERE cbo_num=#{cbo_num}")
	public void deleteFavByCommunityNum(Long cbo_num);
	
	/*-----------------------------댓글/답글-----------------------------*/
	//부모글 삭제 시 댓글(답글) 삭제
	@Delete("DELETE cboard_re WHERE cbo_num=#{cbo_num}")
	public void deleteCommentByCboNum(Long cbo_num);
	
	//댓글 및 대댓글 조회
	public List<CommunityReplyVO> selectListCommentAndReply(Map<String, Object> map); //댓글 및 답글 총 목록
	@Select("SELECT COUNT(*) FROM cboard_re WHERE cbo_num=#{cbo_num}")
	public Integer selectRowCountCommentAndReply(Map<String, Object> map); //댓글 및 답글 총 개수
	
	//댓글
	public List<CommunityReplyVO> selectListComment(Map<String, Object> map);
	@Select("SELECT * FROM cboard_re WHERE cre_num=#{cre_num}")
	public CommunityReplyVO selectComment(Long cre_num); //작성자를 구하기 위함
	@Select("SELECT COUNT(*) FROM cboard_re WHERE cbo_num=#{cbo_num}")
	public Integer selectCountComment(Long cre_num);//댓글수(답글포함)
	public void insertComment(CommunityReplyVO communityReply);
	@Update("UPDATE cboard_re SET cre_content=#{cre_content},cre_mdate=SYSDATE WHERE cre_num=#{cre_num}")
	public void updateComment(CommunityReplyVO communityReply);
	@Delete("DELETE cboard_re WHERE cre_num=#{cre_num}")
	public void deleteComment(Long cre_num);
	@Select("SELECT c.*, p.cbo_title AS postTitle FROM cboard_re c JOIN cboard p ON c.cbo_num = p.cbo_num WHERE c.mem_num = #{userNum}")
	public List<CommunityReplyVO> selectCommentsByUser(long userNum);
	
	//대댓글
	public List<CommunityReplyVO> selectListReply(Long cre_num);
	public CommunityReplyVO selectReply(Long cre_num);
	@Select("SELECT COUNT(*) FROM cboard_re WHERE cre_report < 10 START WITH cre_ref=#{cre_num} CONNECT BY PRIOR cre_num=cre_ref ORDER SIBLINGS BY cre_rdate")
	public Integer selectCountReply(Long cre_num);
	public void insertReply(CommunityReplyVO communityReply);
	public void updateReply(CommunityReplyVO communityReply);
	public void deleteReply(Long cre_num);
	
	//댓글 삭제 시 답글 삭제
	
	
	/*---댓글(답글) 좋아요---*/
	/*
	 * @Select("SELECT * FROM cboard_re_fav WHERE cre_num=#{cre_num} AND mem_num=#{mem_num}"
	 * ) public CommunityReFavVO selectReFav(CommunityReFavVO fav);
	 * 
	 * @Select("SELECT COUNT(*) FROM cboard_re_fav WHERE cre_num=#{cre_num}") public
	 * Integer selectReFavCount(Long cre_num);
	 * 
	 * @Insert("INSERT INTO cboard_re_fav (cre_num,mem_num) VALUES (#{cre_num},#{mem_num})"
	 * ) public void insertReFav(CommunityReFavVO fav);
	 * 
	 * @Delete("DELETE FROM cboard_re_fav WHERE cre_num=#{cre_num} AND mem_num=#{mem_num}"
	 * ) public void deleteReFav(CommunityReFavVO fav); //댓글(답글) 삭제 시 좋아요 삭제
	 * 
	 * @Delete("DELETE FROM cboard_re_fav WHERE cre_num=#{cre_num}") public void
	 * deleteReFavByReNum(Long cre_num); //게시판 삭제 시 좋아요 삭제
	 * 
	 * @Delete("DELETE FROM cboard_re_fav WHERE cre_num IN (SELECT cre_num FROM cboard_re_fav WHERE cbo_num=#{cbo_num})"
	 * ) public void deleteReFavByCommunityNum(Long board_num);
	 */
}

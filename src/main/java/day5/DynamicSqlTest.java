package day5;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import day4.mybatis.dao.MybatisProductDao;
import day4.mybatis.dto.ProductDto;

public class DynamicSqlTest {

	public static void main(String[] args) {
		testOrderBy();
	}
	public static void testNoFilter() {
		MybatisProductDao dao = new MybatisProductDao();
		List<ProductDto> list = dao.search(null);
		System.out.println("검색 필터 없음 : " + list);		//전체 조회
	}
	
	public static void testOrderBy() {
		MybatisProductDao dao = new MybatisProductDao();
		Map<String, Object> map = new HashMap<>();
		map.put("column", "category");			//컬럼명 지정하여 정렬하기(컬럼명 정확히)
		List<ProductDto> list = dao.search(map);
		System.out.println("검색 필터 없음 : " + list);		//전체 조회
	}
	
	public static void testPriceFilter() {
		MybatisProductDao dao = new MybatisProductDao();
		Map<String, Object> map = new HashMap<>();
//		문제 : 가격 필터도 적용되도록 매퍼 xml 의 동적쿼리를 수정하세요.
		map.put("from", 10000);			
		map.put("to", 40000);
		List<ProductDto> list = dao.search(map);
		System.out.println("검색 필터 -상품명과 카테고리 그리고 가격 : " + list);		//전체 조회
	}
	
	
	public static void testAllFilter() {
		MybatisProductDao dao = new MybatisProductDao();
		Map<String, Object> map = new HashMap<>();
		map.put("category", "A2");
		map.put("keyword", "망고");		
//		문제 : 가격 필터도 적용되도록 매퍼 xml 의 동적쿼리를 수정하세요.
		map.put("from", 10000);			
		map.put("to", 40000);
		List<ProductDto> list = dao.search(map);
		System.out.println("검색 필터 -상품명과 카테고리 그리고 가격 : " + list);		//전체 조회
	}
	
	public static void testPnameCateFilter() {
		MybatisProductDao dao = new MybatisProductDao();
		Map<String, Object> map = new HashMap<>();
		map.put("category", "A1");
		map.put("keyword", "사과");			//key는 파라미터 이름, value 는 검색하고 싶은 컬럼값
						//key는 매퍼 xml 확인		// value는 변경해서 테스트하기
		List<ProductDto> list = dao.search(map);
		System.out.println("검색 필터 -상품명과 카테고리 : " + list);		//전체 조회
	}
	
	public static void testPnameFilter() {
		MybatisProductDao dao = new MybatisProductDao();
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", "사과");			//key는 파라미터 이름, value 는 검색하고 싶은 컬럼값
						//key는 매퍼 xml 확인		// value는 변경해서 테스트하기
		List<ProductDto> list = dao.search(map);
		System.out.println("검색 필터 -상품명 : " + list);		//전체 조회
	}
	
	public static void testCateFilter() {
		MybatisProductDao dao = new MybatisProductDao();
		Map<String, Object> map = new HashMap<>();
		map.put("category", "A2");			//key는 파라미터 이름, value 는 검색하고 싶은 컬럼값
						//key는 매퍼 xml 확인		// value는 변경해서 테스트하기
		List<ProductDto> list = dao.search(map);
		System.out.println("검색 필터 -카테고리 : " + list);		//전체 조회
	}
	

}

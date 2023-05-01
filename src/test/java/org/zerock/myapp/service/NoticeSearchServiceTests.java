package org.zerock.myapp.service;

import java.util.List;
import java.util.concurrent.TimeUnit;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.Timeout;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.zerock.myapp.domain.Criteria;
import org.zerock.myapp.domain.NoticeDTO;
import org.zerock.myapp.exception.ServiceException;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/**/root-*.xml")

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class NoticeSearchServiceTests {
	
	@Setter(onMethod_=@Autowired)
	private NoticeSearchService service;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
	} // beforeAll
	
//	@Disable
	@Test
	@Order(1)
	@DisplayName("테스트 1 : NoticeSearchList")
	@Timeout(value=2, unit=TimeUnit.SECONDS)
	void NoticeSearchList() throws ServiceException {
		log.info("NoticeSearch() invoked");
		
		Criteria cri = new Criteria();
		
		//테스트해볼 keyword 적기
		cri.setKeyword("공지");
		log.info("cri: " + cri);
		
		List<NoticeDTO> list = this.service.noticeSearchList(cri);
		log.info("list: " + list);
		
		Integer totalFaq = this.service.totalNotice(cri);
		log.info("total: " + totalFaq);
		
	} // NoticeSearchList
	

	
	
} // end class
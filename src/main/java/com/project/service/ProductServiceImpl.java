package com.project.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.domain.ProductDTO;
import com.project.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	
	private ProductMapper mapper;
	
	@Autowired
	public ProductServiceImpl(ProductMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public Map prodInsert(MultipartHttpServletRequest mhr, HttpServletRequest request) throws Exception {
		String UPLOAD_DIR = "resources/prod_img";
		
		// 서버의 물리적인 경로 얻어오기
		String uploadPath = request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		
		
		// 파라미터명과 파라미터값을 담기위해서
		Map map = new HashMap();
		
//		MultipartHttpServletRequest : 일반 데이터 및 바이너리 데이터를 모두 받을 수 있다.
//		String id = mhr.getParameter("id");
//		String name = mhr.getParameter("name");
//		System.out.println(id + " : " + name);
		
		// 파라미터명을 가져오기(input태그의 name속성의 값을 가져오기)
		// Enmeration 컬렉션 : Iterator와 비슷한 객체
		// getParameterNames()는 리턴 타입이 Enumeration<String>
		Enumeration<String> enu = mhr.getParameterNames();

		
		while(enu.hasMoreElements()) {
			// 파라미터명을 가져오기
			String paramName = enu.nextElement();
			// 파라미터값 가져오기
			String paramValue = mhr.getParameter(paramName);
			System.out.println(paramName + ": " + paramValue);
			
			// 일반 파라미터의 파라미터명(key), 파라미터값을 map에 추가
			map.put(paramName, paramValue);
		}
		
		System.out.println(map);
		
		// 파일명을 갖고 있는 파라미터 읽어오기 
		//getFileNames() : input의 name속성에 있는 파라미터 값을 가져옴(file1, file2, file3,...)
		Iterator<String> iter =mhr.getFileNames();
		List<String> fileList = new ArrayList<String>();
		
		int cnt = 1;		
		while(iter.hasNext()) {
			String fParamName = iter.next();
			System.out.println("fParamName : " + fParamName);
			
			// getFile(input의 name파라미터값) : 파일정보를 가져오기(파일명, 파일타입, 파일크기....)
//			MultipartFile : 파일정보를 갖고 있는 객체 
//			getFile()의 리턴 타입은 MultipartFile
			 MultipartFile mFile = mhr.getFile(fParamName);
			 
			 // 업로드된 파일명을 가져오기
			 String originalName = mFile.getOriginalFilename();
			 System.out.println("orginalName : " + originalName);
			 
			 
			 File file = new File(uploadPath + "//" + fParamName);
			 
			 if(mFile.getSize() != 0) { // 업로드된 경우
				 // 최초에는 폴더 생성이 안되어있기 때문에..파일을 처음 업로드할 때 폴더를 생성해줌
				 // 두번째 파일을 업로드시에는 아래의 if문은 수행안됨
				 if(!file.exists()) { // 경로에 파일이 있는지 확인하고, 없으면 실행(처음에 한번만 실행)
					 if(file.getParentFile().mkdir()) { // uploadPath에 지정된 폴더 생성 (file_repo폴더)
						file.createNewFile(); // 임시로 파일 생성 : file1
					 } // if
				 }// if
				
				// 실제 업로드된 파일을 저장하기 위해 File객체를 생성 
				File uploadFile = new File(uploadPath + "//"+originalName);
				
				// 중복처리
//				if(uploadFile.exists()) {
//					originalName =System.currentTimeMillis()+"_"+originalName;
//					uploadFile = new File(uploadPath + "\\"+originalName);
//				}
				
				// 실제 파일 업로드
				mFile.transferTo(uploadFile);
				fileList.add(originalName); // 파일명을 리스트에 추가
				
				map.put("pImage_"+ cnt, originalName);
				
			 } //if
			 
			 cnt++; 
		}// while문
		
		map.put("fileList", fileList); // 파일 리스트를 맵에 추가
		
		System.out.println("fileList : " + fileList);
		System.out.println("map : " + map);
		
		mapper.productInsert(map);
		return map;
	}	

	@Override
	public List<ProductDTO> prodList() {
		return mapper.productList();
	}

	@Override
	public ProductDTO prodInfo(int pNo) {
		return mapper.productInfo(pNo);
	}

	@Override
	public Map prodUpdate(MultipartHttpServletRequest mhr, HttpServletRequest request) throws Exception {
		String UPLOAD_DIR = "resources/prod_img";
		
		// 서버의 물리적인 경로 얻어오기
		String uploadPath = request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		
		// 파라미터명과 파라미터값을 담기 위해서
		Map map = new HashMap();
		
//		MultipartHttpServletRequest : 일반 데이터 및 바이너리 데이터를 모두 받을 수 있다.
//		String id = mhr.getParameter("id");
//		String name = mhr.getParameter("name");
//		System.out.println(id + " : " + name);
		
		// 파라미터명을 가져오기(input태그의 name속성의 값을 가져오기)
		// Enmeration 컬렉션 : Iterator와 비슷한 객체
		// getParameterNames()는 리턴 타입이 Enumeration<String>
		Enumeration<String> enu = mhr.getParameterNames();

		
		while(enu.hasMoreElements()) {
			// 파라미터명을 가져오기
			String paramName = enu.nextElement();
			// 파라미터값 가져오기
			String paramValue = mhr.getParameter(paramName);
			System.out.println(paramName + ": " + paramValue);
			
			// 일반 파라미터의 파라미터명(key), 파라미터값을 map에 추가
			map.put(paramName, paramValue);
		}
		
		System.out.println(map);
		
		// 파일명을 갖고 있는 파라미터 읽어오기 
		//getFileNames() : input의 name속성에 있는 파라미터 값을 가져옴(file1, file2, file3,...)
		Iterator<String> iter =mhr.getFileNames();
		List<String> fileList = new ArrayList<String>();
		
		int cnt = 1;		
		while(iter.hasNext()) {
			String fParamName = iter.next();
			System.out.println("fParamName : " + fParamName);
			
			// getFile(input의 name파라미터값) : 파일정보를 가져오기(파일명, 파일타입, 파일크기....)
//			MultipartFile : 파일정보를 갖고 있는 객체 
//			getFile()의 리턴 타입은 MultipartFile
			 MultipartFile mFile = mhr.getFile(fParamName);
			 
			 // 업로드된 파일명을 가져오기
			 String originalName = mFile.getOriginalFilename();
			 System.out.println("orginalName : " + originalName);
			 
			 
			 File file = new File(uploadPath + "//" + fParamName);
			 
			 if(mFile.getSize() != 0) { // 업로드된 경우
				 // 최초에는 폴더 생성이 안되어있기 때문에..파일을 처음 업로드할 때 폴더를 생성해줌
				 // 두번째 파일을 업로드시에는 아래의 if문은 수행안됨
				 if(!file.exists()) { // 경로에 파일이 있는지 확인하고, 없으면 실행(처음에 한번만 실행)
					 if(file.getParentFile().mkdir()) { // uploadPath에 지정된 폴더 생성 (file_repo폴더)
						file.createNewFile(); // 임시로 파일 생성 : file1
					 } // if
				 }// if
				
				// 실제 업로드된 파일을 저장하기 위해 File객체를 생성 
				File uploadFile = new File(uploadPath + "//"+originalName);
				
				// 중복처리
//				if(uploadFile.exists()) {
//					originalName =System.currentTimeMillis()+"_"+originalName;
//					uploadFile = new File(uploadPath + "\\"+originalName);
//				}
				
				// 실제 파일 업로드
				mFile.transferTo(uploadFile);
				fileList.add(originalName); // 파일명을 리스트에 추가
				
				map.put("pImage_"+ cnt, originalName);
				
			 } //if
			 
			 cnt++; 
		}// while문
		
		map.put("fileList", fileList); // 파일 리스트를 맵에 추가
		
		System.out.println("fileList : " + fileList);
		System.out.println("map : " + map);
		
		mapper.productUpdate(map);
		return map;
	}
	
	@Override
	public int prodDelete(int pNo) {
		return mapper.productDelete(pNo);
	}

	@Override
	public List<ProductDTO> getProdBySpec(String pSpec) {
		return mapper.getProductBySpec(pSpec);
	}

	@Override
	public ProductDTO prodView(int pNo) {
		return mapper.productView(pNo);
	}
	
}

//
//  Region.swift
//  Bloom
//
//  Created by 조다은 on 6/11/24.
//

import Foundation

struct Region {
    let city: String
    let districts: [String]
}

let regions: [Region] = [
    Region(city: "서울특별시", districts: [
        "종로구", "중구", "용산구", "성동구", "광진구", "동대문구", "중랑구", "성북구",
        "강북구", "도봉구", "노원구", "은평구", "서대문구", "마포구", "양천구", "강서구",
        "구로구", "금천구", "영등포구", "동작구", "관악구", "서초구", "강남구", "송파구", "강동구"
    ]),
    Region(city: "부산광역시", districts: [
        "중구", "서구", "동구", "영도구", "부산진구", "동래구", "남구", "북구", "강서구",
        "해운대구", "사하구", "금정구", "연제구", "수영구", "사상구", "기장군"
    ]),
    Region(city: "대구광역시", districts: [
        "중구", "동구", "서구", "남구", "북구", "수성구", "달서구", "달성군", "군위군"
    ]),
    Region(city: "인천광역시", districts: [
        "중구", "동구", "미추홀구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"
    ]),
    Region(city: "광주광역시", districts: [
        "동구", "서구", "남구", "북구", "광산구"
    ]),
    Region(city: "창원특례시", districts: [
        "마산합포구", "마산회원구", "의창구", "성산구", "진해구"
    ]),
    Region(city: "대전광역시", districts: [
        "중구", "서구", "유성구", "대덕구"
    ]),
    Region(city: "울산광역시", districts: [
        "중구", "남구", "동구", "북구", "울주군"
    ]),
    Region(city: "세종특별자치시", districts: [
        "조치원읍", "연기면", "연동면", "부강면", "금남면", "장군면", "연서면",
        "전의면", "전동면", "소정면", "한솔동", "새롬동", "나성동", "다정동",
        "도담동", "어진동", "해밀동", "아름동", "종촌동", "고운동", "보람동",
        "대평동", "소담동", "반곡동"
    ])
]

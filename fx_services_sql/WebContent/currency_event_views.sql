
TRUNCATE CURRENCY_NEXT_PERIOD_EVENTS;

set @date1 := NOW();
set @date2 := ADDTIME(NOW(), '1 0:0:0.0');
select @date1 as SAMPLE_DATE, @date2 as END_DATE;

INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('USD', @date1, 1, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 1 and CROSS_NAME = 'USD' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('USD', @date1, 2, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 2 and CROSS_NAME = 'USD' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('USD', @date1, 3, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 3 and CROSS_NAME = 'USD' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('GBP', @date1, 1, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 1 and CROSS_NAME = 'GBP' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('GBP', @date1, 2, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 2 and CROSS_NAME = 'GBP' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('GBP', @date1, 3, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 3 and CROSS_NAME = 'GBP' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('EUR', @date1, 1, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 1 and CROSS_NAME = 'EUR' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('EUR', @date1, 2, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 2 and CROSS_NAME = 'EUR' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('EUR', @date1, 3, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 3 and CROSS_NAME = 'EUR' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('JPY', @date1, 1, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 1 and CROSS_NAME = 'JPY' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('JPY', @date1, 2, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 2 and CROSS_NAME = 'JPY' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('JPY', @date1, 3, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 3 and CROSS_NAME = 'JPY' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('AUD', @date1, 1, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 1 and CROSS_NAME = 'AUD' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('AUD', @date1, 2, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 2 and CROSS_NAME = 'AUD' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('AUD', @date1, 3, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 3 and CROSS_NAME = 'AUD' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('CHF', @date1, 1, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 1 and CROSS_NAME = 'CHF' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('CHF', @date1, 2, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 2 and CROSS_NAME = 'CHF' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('CHF', @date1, 3, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 3 and CROSS_NAME = 'CHF' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('CAD', @date1, 1, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 1 and CROSS_NAME = 'CAD' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('CAD', @date1, 2, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 2 and CROSS_NAME = 'CAD' and EVENT_TIME > @date1 and EVENT_TIME < @date2));
INSERT INTO CURRENCY_NEXT_PERIOD_EVENTS (CURRENCY, DAY, SEVERITY, EVENT_COUNT) VALUES ('CAD', @date1, 3, (select count(*) from IMPACT_ANALYSIS where SEVERITY = 3 and CROSS_NAME = 'CAD' and EVENT_TIME > @date1 and EVENT_TIME < @date2));


select 'USD' as CROSSNAME, '1' AS SEVERITY, count(*) AS EVENTS from IMPACT_ANALYSIS where SEVERITY = 1 and CROSS_NAME = 'USD' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'USD', '2',count(*) from IMPACT_ANALYSIS where SEVERITY = 2 and CROSS_NAME = 'USD' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'USD', '3',count(*) from IMPACT_ANALYSIS where SEVERITY = 3 and CROSS_NAME = 'USD' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'GBP', '1',count(*) from IMPACT_ANALYSIS where SEVERITY = 1 and CROSS_NAME = 'GBP' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'GBP','2', count(*) from IMPACT_ANALYSIS where SEVERITY = 2 and CROSS_NAME = 'GBP' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'GBP', '3',count(*) from IMPACT_ANALYSIS where SEVERITY = 3 and CROSS_NAME = 'GBP' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'EUR', '1',count(*) from IMPACT_ANALYSIS where SEVERITY = 1 and CROSS_NAME = 'EUR' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'EUR', '2',count(*) from IMPACT_ANALYSIS where SEVERITY = 2 and CROSS_NAME = 'EUR' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'EUR', '3',count(*) from IMPACT_ANALYSIS where SEVERITY = 3 and CROSS_NAME = 'EUR' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'JPY', '1',count(*) from IMPACT_ANALYSIS where SEVERITY = 1 and CROSS_NAME = 'JPY' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'JPY', '2',count(*) from IMPACT_ANALYSIS where SEVERITY = 2 and CROSS_NAME = 'JPY' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'JPY', '3',count(*) from IMPACT_ANALYSIS where SEVERITY = 3 and CROSS_NAME = 'JPY' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'AUD', '1',count(*) from IMPACT_ANALYSIS where SEVERITY = 1 and CROSS_NAME = 'AUD' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'AUD', '2',count(*) from IMPACT_ANALYSIS where SEVERITY = 2 and CROSS_NAME = 'AUD' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'AUD', '3',count(*) from IMPACT_ANALYSIS where SEVERITY = 3 and CROSS_NAME = 'AUD' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'CHF', '1',count(*) from IMPACT_ANALYSIS where SEVERITY = 1 and CROSS_NAME = 'CHF' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'CHF', '2',count(*) from IMPACT_ANALYSIS where SEVERITY = 2 and CROSS_NAME = 'CHF' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'CHF', '3',count(*) from IMPACT_ANALYSIS where SEVERITY = 3 and CROSS_NAME = 'CHF' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'CAD', '1',count(*) from IMPACT_ANALYSIS where SEVERITY = 1 and CROSS_NAME = 'CAD' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'CAD', '2',count(*) from IMPACT_ANALYSIS where SEVERITY = 2 and CROSS_NAME = 'CAD' and EVENT_TIME > @date1 and EVENT_TIME < @date2
union all
select 'CAD', '3',count(*) from IMPACT_ANALYSIS where SEVERITY = 3 and CROSS_NAME = 'CAD' and EVENT_TIME > @date1 and EVENT_TIME < @date2;

select CROSS_NAME, sum(TRADE_SESSION_ROLL_COUNT) as "Higher Value Longer Trends" from OCCURENCE group by CROSS_NAME;

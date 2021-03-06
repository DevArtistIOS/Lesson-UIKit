//
//  TextOnView.swift
//  ДЗ UITabBar (yoga)
//
//  Created by dream.one on 27.07.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class TextOnView: UIViewController {

    static let asanaArray = [textAsana1, textAsana2, textAsana3, textAsana4, textAsana5, textAsana6, textAsana7, textAsana8, textAsana9, textAsana10]
    
    static let mythsArray = [myth, myth2, myth3, myth4, myth5, myth6, myth7, myth8, myth9, myth10, myth11, myth12, myth13, myth14]
    
    static let asanaImageArray =   [UIImage(named: "asana1"),
                                    UIImage(named: "asana2"),
                                    UIImage(named: "asana3"),
                                    UIImage(named: "asana4"),
                                    UIImage(named: "asana5"),
                                    UIImage(named: "asana6"),
                                    UIImage(named: "asana7"),
                                    UIImage(named: "asana8"),
                                    UIImage(named: "asana9"),
                                    UIImage(named: "asana10")]
    

}
let textAsana1 = """
- Для выполнения позы верблюда опуститесь на колени, поставив ноги на ширине таза. Руки свободно опустите назад.
- Сделайте выдох и прогнитесь назад с опорой на одну руку, вторую при этом вытяните вверх. Напрягите мышцы ягодиц и следите за тем, чтобы они оставались перпендикулярны полу – не заваливайтесь назад и не оседайте на пятки. Задержитесь на 10-15 секунд.
- Выполните в другую сторону, поменяв руки.
- Встаньте на колени и упритесь кулаками в поясницу. На выдохе прогнитесь назад. Задержитесь в этом положении на 5 дыхательных циклов.
Поза позволяет размять позвоночник после длительного сна и растянуть мышцы живота.
"""

let textAsana2 = """
Встаньте ровно и поставьте стопы на ширине плеч.
Вытяните прямые руки вверх, развернув ладони друг к другу.
Медленно согните ноги в коленях, отклоняя прямой корпус вперед, будто вы садитесь ягодицами на стул. Руки при этом остаются вытянутыми в одну линию с корпусом.
Задержитесь в этой позе на несколько десятков секунд, затем снова выпрямитесь, вернувшись в исходное положение.
Пребывание в этой позе прекрасно укрепляет мышцы ног и корпуса. Ваше тело станет более сильным и выносливым.
"""
    
let textAsana3 = """
Встаньте прямо и поставьте стопы параллельно друг другу.
Проворачиваясь в бедрах, наклоните прямой корпус к ногам и постарайтесь достать пола руками. Спину расслабьте, пусть ваше тело свисает вниз под собственным весом. Шею не напрягайте.
Старайтесь направлять нос к коленям, и не сгибайте ноги – они должны быть прямыми. Оставайтесь в этой позе не менее 10-15 секунд.
Эта поза прекрасно растягивает спину, массажирует внутренние органы, в частности, печень и селезенку
"""
    
let textAsana4 = """
Поставьте ноги шире плеч, левая стопа направлена наружу, правая внутрь – к средней линии тела.
Прямые руки разведите в стороны на уровне плеч, ладони направьте вниз.
Плавно опускайтесь корпусом влево, пытаясь достать левой рукой мизинца левой стопы. Вторая рука при этом направлена вертикально вверх. Задержитесь в этой позе на несколько секунд.
Медленно вернитесь в исходное положение.
Разверните стопы вправо и повторите наклон в правую сторону.
Эта поза также очень полезна для позвоночника, массажирует кишечник, укрепляет мышцы корпуса.
"""
    
let textAsana5 = """
Лягте на коврик на спину, руки вытяните вдоль тела, ладони направлены в пол.
Поднимите прямые ноги вверх и заведите за голову, стараясь поставить носки на пол. Колени при этом старайтесь держать прямыми. Если с прямыми ногами достать до пола не получается – пусть стопы висят в воздухе.
Медленно развернитесь в исходное положение позвонок за позвонком.
Это упражнение разминает пояснично-крестцовый и шейный отделы позвоночника.
"""
    
let textAsana6 = """
Исходное положение – как в предыдущем упражнении.
Поднимите прямые ноги вертикально вверх, далее за ногами поднимите таз, поддерживая себя ладонями. Старайтесь продвинуть ладони ближе к лопаткам.
Сначала задерживайтесь в этой позе 10 секунд, далее от занятия к занятию постепенно увеличивайте время, пока не дойдете до трех минут.
Выходите из позы медленно раскатывая позвоночник по полу.
Поза свечи по праву считается одной из самых полезных поз для органов всего тела.
"""

let textAsana7 = """
Встаньте на четвереньки. Подтяните правое колено вперёд между рук и разверните правую стопу влево. Пятка правой ноги должна быть под левым бедром или же под животом.
Вытяните левую ногу назад и постарайтесь максимально опустить таз вниз. Согните локти и обопритесь на предплечья. Наклонитесь ещё ниже, вытягивая левую ногу назад.
Для усиления растяжки медленно выпрямите руки. Смотрите прямо перед собой, вытягивая, но не напрягая мышцы шеи.
Осуществляйте выход из позы медленно и осторожно. Повторите движение с другой стороны.
Поза голубя хорошо подходит для подготовки мышц к растяжке на шпагат.
"""
    
let textAsana8 = """
Сядьте, выпрямите спину и ноги.
Заведите правую ногу за левую. Стопу поставьте рядом с левым коленом. При этом левая нога должна быть прямой.
Возьмитесь левой рукой за правое колено.
На выдохе медленно скрутите позвоночник в правую сторону. Для удобства поставьте правую ладонь на пол, а локоть левой руки заведите за колено. Смотрите назад за себя.
При каждом выдохе пытайтесь скрутить позвоночник ещё сильнее. Выполняйте в течение 3-5 вдохов-выдохов.
Повторите в другую сторону.
"""

let textAsana9 = """
Опуститесь на колени и сядьте на пятки.
Сделав глубокий вдох, наклонитесь вперёд и прижмитесь животом к бёдрам. Не забывайте держать спину ровно.
Опустите лоб на кровать и вытяните руки вдоль туловища. Ладони должны быть повёрнуты наверх.
Сконцентрируйтесь и почувствуйте плавные движения груди при каждом вдохе и выдохе.
Для выхода из позы сначала поднимите голову, а затем медленно выпрямите спину.
"""

let textAsana10 = """
Пребыванием в этой позе в течение 4-5 миинут в идеале завершается любой комплекс йога упражнений. Для начинающих это особенно важно, так как учиться правильно расслабляться необходимо с первых же занятий.
Лягте на спину, вытяните руки вдоль корпуса и закройте глаза.
Максимально напрягите все мышцы тела и продержитесь так несколько секунд.
Полностью расслабьтесь, пройдитесь мысленно по всему телу от головы до пальцев ног и сосредоточьтесь только на своем дыхании.
Теперь вы полностью готовы к началу активного и полного впечатлений дня!
"""

let myth = "Люди, практикующие йогу, становятся более позитивными, веселыми, добродушными и целеустремленными, появляется чувство внутренней свободы и ощущение единства со всем миром. Йога не является «противопоставлением общепринятых норм», она является дополнением, помогающим человеку более эффективно реализоваться в социуме, семье, «найти себя»."

let myth2 = "Йога является не религиозной, а духовной системой, или системой духовного самосовершенствования. Йогой занимаются христиане, мусульмане, буддисты и атеисты. Йога не навязывает и не требует каких-либо религиозных идей или предпочтений, она наоборот ведет к ясности ума, заставляет человека мыслить, анализировать свои поступки и намерения, подвергать сомнению навязанные взгляды и изучать. По своей сути йога близка скорее к науке, а не к религии, так как йога создавалась древними мудрецами (риши), которые путем исследования, проб, ошибок и наблюдений выработали и систематизировали упражнения, которые помогают человеку усовершенствовать свое тело и ум, вырасти духовно и стать более гармоничным и уравновешенным."

let myth3 = "Йога ничего не навязывает и не требует от практикующего. Есть некоторые рекомендации (в том числе и по питанию), которые помогают ускорить прогресс в практике и повысить ее эффективность. Рекомендуется исключить опиаты, одурманивающие и опьяняющие вещества, так как они понижают осознанность, притупляют личность и отнимают огромное количество энергии, вместо активности появляется апатия и подавленность, что противоречит сути йоги. Занятия йогой ведут к ясности ума, и энергичности. Тем ни менее человек, занимающийся йогой, может есть мясо, или отказываться от него, но не путем насилия над собой и волевым усилием, а просто прислушавшись к потребностям своего организма."

let myth4 = "Занятия йогой – это комплексы упражнений, направленные на укрепление и расслабление тела, обретение физической гармонии. Научно доказано, что самый простой и эффективный способ расслабить напряженную мышцу – ее растянуть, поэтому йога включает комплексы растяжки для ног и тазобедренных суставов, но в данном случае, целью упражнений является не сама растяжка, а расслабление мышц и работа с дыханием и вниманием."

let myth5 = "Йога действительно позволяет человеку обрести определенный контроль над телом – лучше чувствовать и понимать свое тело, предчувствовать нарушения внутреннего баланса и осознавать свои потребности. Но для обретения полного контроля над организмом требуются долгие годы очень упорных тренировок."

let myth6 = "Йога не приветствует уход из социума или бегство от проблем. Правильная практика йоги дает огромное количество энергии, которую можно вкладывать в любые дела, и особенно в свое развитие и реализацию. Большинство практиков йоги – успешные, социально реализованные люди, со счастливыми семьями. Йога – это счастье, удовольствие от жизни, что зачастую включает с себя активную социальную деятельность."

let myth7 = "Замедление метаболизма означает, что йога, наоборот, способствует набору веса. В целом же невозможно похудеть без интенсивного сжигания калорий. Но при занятиях йогой расход калорий настолько ничтожен, что его трудно принимать в расчет для снижения веса. А легендарная худоба настоящих йогов, таких, каких рисуют на картинках, - результат многолетнего режима ограниченного питания."

let myth8 = "Йога может быть очень опасна. Вот что, например, говорит Уильям Броуд, автор книги «Наука Йоги» и журналист «Таймс»: «Йога – это лишь инструмент. Любым инструментом, если использовать его неправильно, можно что-то сломать. Йога может произвести целую волну травм и негативных последствий… В целом же как риски, так и достоинства йоги в многократном количестве превзошли мои ожидания». Особенно опасна так называемая «горячая йога», когда занятия йогой происходят в условиях повышенной температуры и влажности."

let myth9 = "Правда заключается в том, что все люди, а не только женщины, находятся в поиске внутренней гармонии и спокойствия, хотят избежать болезней и жить, сохраняя здоровье, долго и счастливо. Йога предлагает нечто для любого, кто заинтересован в физическом, ментальном или духовном развитии, и не является дисциплиной только для женщин или только для мужчин. Многие мужчины (включая спортсменов) занимаются йогой регулярно, и они обнаружили, что это дает им большие преимущества во всех сферах жизни. В наш йога центр мужчины приходят заниматься как на классы Йога для начинающих 1 и 2, так и на более продвинутые уровни - Основной класс, Интенсивный класс, Классы для преподавателей йоги. Жесткость тела можно преодолеть регулярной практикой йоги, а классы Здоровая спина могут быть крайне эффективны для снятия болей в спине и в шее, улучшить сон, избавиться от стресса."

let myth10 = "К этим мифам относятся убеждения вроде: «Все люди, занимающиеся йогой много лет, выглядят молодо», «Все занимающиеся йогой люди - долгожители, и никогда не болеют», «Если заниматься йогой, вы обязательно достигнете духовного просветления».Эти мифы развеиваются по мере того, как практика йоги становится более зрелой. То, что может быть справедливо для одного человека, не обязательно является правдой для другого. Йога не является панацеей от всех болезней, не увеличивает продолжительность жизни в два-три раза каждому практикующему, не каждый практикующий йогу станет просветленным мудрецом. Практика йоги дает новую степень осознанности себя, помогает успокоить ум, пребывать интенсивно в настоящем моменте, научиться отличать важное от неважного и благое от приятного. Это не является чем-то сверхъестественным, и в то же время позволяет ощущать новое качество Жизни. Укрепление и поддержание здоровья, сохранение хорошей физической формы, приятная внешность, красивая речь, спокойный ум - далеко не все плоды, которые может принести грамотная практика йоги!"

let myth11 = "Очень хорошо, когда ребенок с ранних лет приобщается к йоге и закладывает себе на будущее мощный фундамент здорового тела и крепкой психики. Это действительно прекрасно, и всем нам стоит прилагать усилия в этом направлении.Однако история пестрит фактами, когда люди начинали практиковать или в пожилом возрасте, или в результате значительных повреждений и отклонений в теле и достигали вершин мастерства. Для иллюстрации хочется привести пример Бельгийской королевы, которую взялся обучать искусству йоги Б.К.С. Айенгар. Все мы знаем, что нынче мода на йогу широко распространилась в «элите общества» и данный факт не был бы столь уникален, если бы не одно НО. На момент начала обучения королеве исполнилось 84 года! В результате тренировок она смогла выполнить поставленную перед собой цель – встать в ширшасану (стойку на голове)."

let myth12 = "Конечно, у большинства из нас в силу семейных обязанностей и социальной жизни нет времени уделить три часа практике асан, пару часов пранаяме и еще несколько часов медитации, но ведь ЭТО и НЕ НУЖНО. Йога – это эффективность в любом действии. Йога должна служить нашей жизни, а не наоборот. Многие не понимают этого момента и делают из йоги культ, в который заставляют поверить самих себя и «затянуть» окружающих. Практика йоги – это безупречное выполнение своих обязанностей, соответственно уровню эволюционного развития. А тут уж, согласитесь, подойдет любая форма деятельности. Кончено, погружение в практику работы с телом занимает значимое место. И в этом могут помочь многие системы йоги, адаптированные под наш бешеный темп жизни, наш менталитет и наше строение опорно-двигательного аппарата."

let myth13 = "Да, человек, регулярно практикующий йогу, действительно на определенном этапе развития становится «не такой как все». Но эта индивидуальная особенность появляется не в результате каких-либо негативных отклонений, а благодаря раскрытию его собственного индивидуального потенциала тела, ума и психики. Такого человека уже достаточно сложно «убедить» с экрана телевизора, что эталон здоровья – это кола и гамбургеры, эталон престижа – это дорогие вещи, а эталон ума – это «качественное и дорогое» образование."

let myth14 = "Чтобы преподавать йогу, недостаточно просто быть гибким и самому практиковать йогу. Для того чтобы стать преподавателем йоги, необходимо пройти специальный курс и практиковать йогу в течение нескольких лет, подкрепляя ее духовным ростом и медитацией. "

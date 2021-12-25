//
//  COVID_Watch_Widget.swift
//  COVID_Watch_Widget
//
//  Created by Trevor Piltch on 11/16/20.
//

import WidgetKit
import SwiftUI
import Intents

struct Model: TimelineEntry {
    var date: Date
    var widgetData: CovidData
    var state: state
}

struct Provider: IntentTimelineProvider {
    typealias Entry = Model
    
    typealias Intent = SelectStateIntent
    
    func getSnapshot(for configuration: SelectStateIntent, in context: Context, completion: @escaping (Model) -> Void) {
        let loadingData = Model(date: Date(), widgetData: CovidData(), state: .NE)
        
        completion(loadingData)
    }
    
    func state(for configuration: SelectStateIntent) -> state {
        let name = configuration.state?.identifier
        
        return returnStateApiKey(for: name ?? "ME")
    }
    
    func getTimeline(for configuration: SelectStateIntent, in context: Context, completion: @escaping (Timeline<Model>) -> Void) {
        Api().getCovidData(country: false, state: state(for: configuration)) { (data) in
            let date = Date()
            let data = Model(date: date, widgetData: CovidData(fields: data), state: state(for: configuration))
            
            let nextUpdate = Calendar.current.date(byAdding: .day, value: 1, to: date)
            let timeline = Timeline(entries: [data], policy: .after(nextUpdate!))
            
            completion(timeline)
        }
    }

    
    func placeholder(in context: Context) -> Model {
        return Model(date: Date(), widgetData: CovidData(), state: .MD)
    }
}

struct SmallWidgetView: View {
    var data: Model
    
    var body: some View {
        Link(destination: URL(string: "\(data.state)")!) {
            VStack {
                Text(returnStateName(state: data.state))
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background(Color("Green"))
                    .font(returnStateName(state: data.state).count < 11 ? .system(.title, design: .rounded) : .system(size: CGFloat(Double(returnStateName(state: data.state).count) * 1.2), weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Text("\(data.widgetData.fields[0].positive!) Cases")
                    .font(data.widgetData.fields[0].positive! < 1000000 ? .system(.title3, design: .rounded) : .system(.headline, design: .rounded))
                
                Divider()
                    .frame(width: 125, height: 0)
                
                Text("\(data.widgetData.fields[0].death!) Deaths")
                    .font(data.widgetData.fields[0].death! < 1000000 ? .system(.title3, design: .rounded) : .system(.headline, design: .rounded))
                
                Spacer()
            }
//            .padding(.horizontal, 5)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(Color("Green"))
        }
    }
}

@main
struct MainWidget: Widget {
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: "com.COVID_Watch.state-detail", intent: SelectStateIntent.self, provider: Provider()) { entry in
            SmallWidgetView(data: entry)
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName(Text("COVID-19 Data Widget"))
        .description(Text("Quickly see how different states are doing throughout your day."))
    }
}

struct COVID_Watch_Widget_Previews: PreviewProvider {
    static var previews: some View {
        SmallWidgetView(data: Model(date: Date(), widgetData: CovidData(), state: .CA))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
